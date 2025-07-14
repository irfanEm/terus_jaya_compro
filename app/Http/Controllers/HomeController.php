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
        return view('home.about', ['title' => 'Tentang']);
    }

    public function services(): View
    {
        return view('home.services', ['title' => 'Layanan']);
    }

    public function projects(): View
    {
        return view('home.projects', ['title' => 'Projects']);
    }

    public function galery(): View
    {
        return view('home.galery', ['title' => 'Galery']);
    }

    public function contacts(): View
    {
        return view('home.contacts', ['title' => 'Kontak']);
    }
}
