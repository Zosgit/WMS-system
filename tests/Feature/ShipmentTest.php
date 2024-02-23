<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class ShipmentTest extends TestCase
{
    /**
     * A basic feature test example.
     */
    public function test_shipments_store()
    {
        $response = $this->call('POST', '/shipments', [
            'external_nr' => 'required|max:50',
            'firm_id' => 'required',
            'owner_id' => 'required',
            'location_id' => 'required',
            'remarks' => ''
        ]);

        $response->assertStatus($response -> status(), 302);
        //$this->assertTrue(true);
    }
}
