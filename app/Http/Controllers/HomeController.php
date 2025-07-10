<?php

namespace App\Http\Controllers;

use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index()
    {
        return view('home.home', ['title' => 'Home']);
    }

    public function about(): View
    {
        return view('home.about');
    }
}
