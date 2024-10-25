<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>{{$page_title}}</title>

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

        <!-- Styles -->
        <link href="{{ asset('css/styles.css') }}" rel="stylesheet">
        
        <!-- Scripts -->
        <script type="text/javascript" src="{{ asset('js/base.js') }}"></script>
    </head>
    <body class="font-sans antialiased dark:bg-black dark:text-white/50">
    @if(Auth::id())
        <a href = "/">Home</a>
        @if(user_has_role(ROLEIDS["ADMIN"]))
            &nbsp;&nbsp;<a href = "/objects">Objects</a>&nbsp;
        @endif
        &nbsp;<a href = "/logout">Logout</a>
    @endif
    <br>
    <br>
