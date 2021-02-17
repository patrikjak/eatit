@extends('errors::minimal')

@section('title', __('Neoprávnený prístup'))
@section('code', '401')
@section('message', __('vyžaduje sa autorizácia'))
