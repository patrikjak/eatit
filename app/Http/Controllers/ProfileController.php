<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\ImageManagerStatic as Image;

use Illuminate\Foundation\Auth\SendsPasswordResetEmails;


class ProfileController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show user profile
     */
    public function index()
    {
        $user = User::where('id', Auth::id())->findOrFail(Auth::id());
        $photo = DB::table('users')->select('profile_photo')->where('id', Auth::id())->get();
        return view('pages.profile')->with(array(
            'user' => $user,
            'photo' => $photo
        ));
    }

    /**
     * Update profile image
     *
     * @param Request $request
     * @param int $id
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     * @throws \Illuminate\Validation\ValidationException
     */
    public function update_profile_image(Request $request, $id)
    {
        $this->validate($request, [
            'profile-photo' => 'file|max:10240'
        ]);

        $photo_extension = $request->file('profile-photo')->getClientOriginalExtension();
        $photo_name = date('YmdHis').'-'.Auth::id();
        $photo_name_to_store = date('YmdHis').'-'.Auth::id().'.'.$photo_extension;

        $users = User::all();
        $user = $users->find($id);

        if (!file_exists(storage_path('app/public/'.Auth::id()))) {
            mkdir(storage_path('app/public/'.Auth::id()), 0750, true);
        }

        if ($user->profile_photo != 'none') {
            Storage::delete('public/'.Auth::id().'/'.$user->profile_photo);
        }

        DB::table('users')->select('profile_photo')->where('id', '=', $id)
            ->update(['profile_photo' => $photo_name_to_store]);

        $img = Image::make($request->file('profile-photo'));
        $img->orientate()->fit(500)->encode();
        $img->save(storage_path('app/public/'.Auth::id().'/').$photo_name_to_store);

        return redirect('/profil');
    }


    /**
     * @param $id
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function delete_profile_image($id)
    {
        $users = User::all();
        $user = $users->find($id);
        if ($user->profile_photo != 'none') {
            Storage::delete('public/'.Auth::id().'/'.$user->profile_photo);
        }

        DB::table('users')->where('id', '=', $id)->update(['profile_photo' => 'none']);

        return redirect('/profil');
    }

    public function change_password(Request $request)
    {
        $this->validate($request, [
            'old-password' => 'required',
            'new-pass' => ['required', 'string', 'min:8', 'regex:/(?=^.{8,32}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s)[0-9a-zA-Z!*^?\+\-\_\@\#\$\%\&\~\§\|\{\}\[\]\(\)\<\>\,\.\:\;\\\€\/\"\'\`]./'],
            'new-pass-repeat' => 'required|same:new-pass',
        ], [
            'old-password.required' => 'Prosím zadajte staré heslo',
            'new-pass.required' => 'Nové heslo je povinné',
            'new-pass.min' => 'Heslo musí obsahovať minimálne :min znakov',
            'new-pass.regex' => 'Heslo má obsahovať veľké a malá písmená a taktiež číslo',
            'new-pass-repeat.required' => 'Je potrebné zadať heslo znova',
            'new-pass-repeat.same' => 'Heslá sa musia zhodovať',
        ]);

        $users = User::all();
        $user = $users->find(Auth::id());

        if (Hash::check($request->input('old-password'), $user->password)) {
            $hashed_password = Hash::make($request->input('new-pass'));
            DB::table('users')->where('id', '=', $user->id)->update(['password' => $hashed_password]);
            if ($request->ajax()) {
                return response()->json([
                    'message' => 'Heslo bolo zmenené',
                ]);
            }
            else {
                return redirect('/profil');
            }
        }
        else {
            if ($request->ajax()) {
                return response()->json([
                    'error' => 'Zadali ste zlé aktuálne heslo',
                    'input' => 'old-password',
                ]);
            }
            else {
                return back()->with('error', 'Zadali ste zlé aktuálne heslo');
            }
        }
    }

}
