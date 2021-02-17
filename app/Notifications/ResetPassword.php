<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class ResetPassword extends Notification
{
    use Queueable;
    public $token;

    /**
     * Create a new notification instance.
     *
     * @param string $token
     * @return void
     */
    public function __construct($token)
    {
        $this->token = $token;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {

        $count = config('auth.passwords.users.expire');

        return (new MailMessage)
            ->subject('Obnovenie hesla')
            ->greeting('Ahoj!')
            ->line('Dostali ste tento e-mail, pretože sme obdržali žiadosť o zmenu hesla.')
            ->action('Obnoviť heslo', url(config('app.url').route('password.reset', ['token' => $this->token, 'email' => $notifiable->getEmailForPasswordReset()], false)))
            ->line('Platnosť tohto odkazu vyprši za '.$count.' minút.')
            ->line('Ak ste si nevyžiadali zmenu hesla, prosím ignorujte tento e-mail.')
            ->salutation("S pozdravom,\r\n\r\nEATIT");
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }

}
