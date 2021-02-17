@extends('errors::minimal')

@section('title', 'Služba nedostupná')
@section('code', '503')
@section('message', __($exception->getMessage() ?: 'služba je dočasne nedostupná'))
