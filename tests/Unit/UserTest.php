<?php

namespace Tests\Unit;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\Faker;
use Illuminate\Support\Facades\Hash;
use Tests\TestCase;
use App\Models\User;
use Illuminate\Support\Facades\DB;

class UserTest extends TestCase
{
    use RefreshDatabase;

    public function test_Successful_Login()
    {
         $user = User::create([
            'name' => 'Test User',
            'email' => 'test@example.com',
            'password' => Hash::make('password123'),
        ]);
        $response = $this->post('/login', [
            'email' => 'test@example.com',
            'password' => 'password123',
        ]);
        $response->assertStatus(302);
        $this->assertAuthenticated();
    }
    public function test_Failed_Login()
    {
        $user = User::create([
            'name' => 'Test User',
            'email' => 'test@example.com',
            'password' => Hash::make('password123'),
        ]);
        $response = $this->post('/login', [
            'email' => 'test@example.com',
            'password' => 'wrongpassword',
        ]);
        $response->assertStatus(302);
        $this->assertGuest();
    }
}
