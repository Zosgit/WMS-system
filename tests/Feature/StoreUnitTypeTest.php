<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class StoreUnitTypeTest extends TestCase
{
    /**
     * A basic feature test example.
     */
    public function test_storeunittypes_store()
    {
        $response = $this->call('POST', '/storeunittypes', [
            'code' => 'required|unique:store_unit_types|max:50',
            'prefix' => 'required',
            'size_x' => 'required|Decimal:2',
            'size_y' => 'required|Decimal:2',
            'size_z' => 'required|Decimal:2',
            'loadwgt' => 'required|Decimal:2',
            'suwgt' => 'required|Decimal:2'
        ]);

        $response->assertStatus($response -> status(), 302);
        //$this->assertTrue(true);
    }
}
