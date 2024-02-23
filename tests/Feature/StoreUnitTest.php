<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class StoreUnitTest extends TestCase
{
    /**
     * A basic feature test example.
     */
    public function test_storeunits_store()
    {
        $response = $this->call('POST', '/storeunits', [
            'number'=> 'required|integer',
            'storeunittype_id'=> 'required|integer'
        ]);

        $response->assertStatus($response -> status(), 302);
        //$this->assertTrue(true);
    }
}
