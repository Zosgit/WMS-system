<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class UserTest extends TestCase
{
    /**
     * A basic feature test example.
     */
    public function test_welcome(): void
    {
        $response = $this->get('/');
        $response->assertStatus(200);
    }
    public function test_route_return_ok()
    {
        $response = $this->get('/');
        $response->assertSee('Log in');
        $response->assertStatus(200);
    }

}
