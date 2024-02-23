<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class ProductMetricTest extends TestCase
{
    /**
     * A basic feature test example.
     */
    public function test_productmetrics_store()
    {
        $response = $this->call('POST', '/productmetrics', [
            'code' => 'required|unique:products|max:50',
            'longdesc' => 'required',
            'amount' => 'required'
        ]);

        $response->assertStatus($response -> status(), 302);
        //$this->assertTrue(true);
    }
}
