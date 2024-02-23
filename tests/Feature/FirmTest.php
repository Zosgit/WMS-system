<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
// use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Http\Controllers\FirmController;
use App\Models\Firm;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FirmTest extends TestCase
{
   use RefreshDatabase;

    /** @test */
    public function test_firms_store()
    {
        $response = $this->call('POST', '/firms', [
            'code' => 'wyw',
            'longdesc' => 'wyw ywy ywy',
            'tax' => '123456789',
            'street' => 'required',
            'postcode' => '38-300',
            'city' => 'required',
            'notes' => 'required',
            'shipment' => 'on',
            'delivery' => 'on',
            'owner' => 'on'
        ]);

        $response->assertStatus($response -> status(), 302);
        //$this->assertTrue(true);
    }
}
