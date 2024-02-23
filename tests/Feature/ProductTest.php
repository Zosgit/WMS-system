<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class ProductTest extends TestCase
{
    /**
     * A basic feature test example.
     */
    public function test_products_store()
    {
        $response = $this->call('POST', '/products', [
            'code' => 'requiredzzz',
            'longdesc' => 'requiredqqq',
            'producttype_id' => 'required',
            'size_x' => '1',
            'size_y' => '1',
            'size_z' => '1',
            'weight' => '1',
            'metric_id' => 'required',
            'ean' => 'required'
        ]);

        $response->assertStatus($response -> status(), 302);
        //$this->assertTrue(true);
    }
}
