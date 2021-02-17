@extends('errors::minimal')

@section('title', __('Prístup zamietnutý'))
@section('code', '403')
@section('message', __($exception->getMessage() ?: 'prístup je zamietuntý'))
