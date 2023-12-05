<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::middleware('auth')->group(function () {
    Route::view('about', 'about')->name('about');

    Route::get('users', [\App\Http\Controllers\UserController::class, 'index'])->name('users.index');
    Route::resource('/products', App\Http\Controllers\ProductController::class);
    Route::resource('/producttypes', App\Http\Controllers\ProductTypeController::class);
    Route::resource('/productmetrics', App\Http\Controllers\ProductMetricController::class);
    Route::resource('/storeunittypes', App\Http\Controllers\StoreUnitTypeController::class);
    Route::resource('/firms', App\Http\Controllers\FirmController::class);
    Route::resource('/storeunits', App\Http\Controllers\StoreUnitController::class);
    Route::resource('/locations', App\Http\Controllers\LocationController::class);

    // pozycje dostawy
    Route::resource('/shipments', App\Http\Controllers\ShipmentController::class);

    Route::get('/shipmentdetail/{shipment}', [App\Http\Controllers\ShipmentDetailController::class,'index'])->name('shipmentdetail.index');
    Route::get('/shipmentdetail/{shipment}/create', [App\Http\Controllers\ShipmentDetailController::class,'create'])->name('shipmentdetail.create');
    Route::post('/shipmentdetail/{shipment}/create', [App\Http\Controllers\ShipmentDetailController::class,'store'])->name('shipmentdetail.store');
    Route::get('/shipmentdetail/{shipment}', [App\Http\Controllers\ShipmentDetailController::class,'show'])->name('shipmentdetail.show');
    Route::get('/shipment/{shipment}/shipmentdetail/{shipmentdetail}/edit', [App\Http\Controllers\ShipmentDetailController::class,'edit'])->name('shipmentdetail.edit');
    Route::put('/shipment/{shipment}/shipmentdetail/{shipmentdetail}/update', [App\Http\Controllers\ShipmentDetailController::class, 'update'])->name('shipmentdetail.update');
    Route::delete('/shipment/{shipment}/shipmentdetail/{shipmentdetail}', [App\Http\Controllers\ShipmentDetailController::class, 'destroy'])->name('shipmentdetail.destroy');
    Route::get('/shipmentdetail/{id}/sendcontrol', [App\Http\Controllers\ShipmentDetailController::class,'sendcontrol'])->name('shipmentdetail.send');

    //kontrola dostawy
    Route::resource('/controls', App\Http\Controllers\ControlController::class);
    Route::post('/controls/{id}/store', [App\Http\Controllers\ControlController::class,'store'])->name('control.store');
    Route::get('/controls/{id}/create', [App\Http\Controllers\ControlController::class,'create'])->name('control.create');
    Route::get('/shipmentdetail/{id}/control', [App\Http\Controllers\ControlController::class,'show'])->name('control.show');

    //wysylka
    Route::resource('/orders', App\Http\Controllers\OrderController::class);

    // Route::get('/shipmentdetail/{shipment}', [App\Http\Controllers\ShipmentDetailController::class,'index'])->name('shipmentdetail.index');
    Route::get('/orderdetail/{order}/create', [App\Http\Controllers\OrderDetailController::class,'create'])->name('orderdetails.create');
    Route::post('/orderdetail/{order}/create', [App\Http\Controllers\OrderDetailController::class,'store'])->name('orderdetail.store');
    Route::get('/orderdetail/{order}', [App\Http\Controllers\OrderDetailController::class,'show'])->name('orderdetail.show');
    Route::get('/order/{order}/orderdetail/{orderdetail}/edit', [App\Http\Controllers\OrderDetailController::class,'edit'])->name('orderdetail.edit');
    Route::put('/order/{order}/orderdetail/{orderdetail}/update', [App\Http\Controllers\OrderDetailController::class, 'update'])->name('orderdetail.update');
    // Route::delete('/shipment/{shipment}/shipmentdetail/{shipmentdetail}', [App\Http\Controllers\ShipmentDetailController::class, 'destroy'])->name('shipmentdetail.destroy');
    Route::get('/orderdetail/{id}/sendpicking', [App\Http\Controllers\OrderDetailController::class,'sendPicking'])->name('orderdetail.send');

    Route::resource('/pickings', App\Http\Controllers\PickingController::class);
    Route::post('/pickings/{id}/store', [App\Http\Controllers\PickingController::class,'store'])->name('picking.store');
    Route::get('/pickings/{id}/create', [App\Http\Controllers\PickingController::class,'create'])->name('picking.create');
    Route::get('/orderdetail/{id}/picking', [App\Http\Controllers\PickingController::class,'show'])->name('picking.show');

    // etykieta lokalizacji multi
    Route::get('/createmulti', [\App\Http\Controllers\LocationMultiController::class,'create'])->name('locations.createmulti');
    Route::post('/storemulti', [\App\Http\Controllers\LocationMultiController::class,'store'])->name('locations.storemulti');
    Route::post('/createmulti', [\App\Http\Controllers\LocationMultiController::class,'index'])->name('locations.indexmulti');
    //Route::resource('/storearea', App\Http\Controllers\StoreAreaController::class);

    Route::get('profile', [\App\Http\Controllers\ProfileController::class, 'show'])->name('profile.show');
    Route::put('profile', [\App\Http\Controllers\ProfileController::class, 'update'])->name('profile.update');
});
