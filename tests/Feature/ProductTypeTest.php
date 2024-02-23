<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class ProductTypeTest extends TestCase
{
    /**
     * A basic feature test example.
     */
    public function test_producttypes_store()
    {
        $response = $this->call('POST', '/producttypes', [
            'code' => 'required|unique:products|max:50'
        ]);

        $response->assertStatus($response -> status(), 302);
        //$this->assertTrue(true);
    }
}
