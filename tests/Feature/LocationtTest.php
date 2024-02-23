<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class LocationtTest extends TestCase
{
    /**
     * A basic feature test example.
     */
    public function test_locations_store()
    {
        $response = $this->call('POST', '/locations', [
            'pos_x' => 'required',
            'pos_y' => 'required',
            'pos_z' => 'required',
            'size_x' => 'required|Decimal:2',
            'size_y' => 'required|Decimal:2',
            'size_z' => 'required|Decimal:2',
            'loadwgt' => 'required|Decimal:2',
            'storearea_id' => 'required',
            'status_id' => 'required',
            'ean' => 'required'
        ]);

        $response->assertStatus($response -> status(), 302);
        //$this->assertTrue(true);
    }
}
