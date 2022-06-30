<?php

namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

// Load the system's routing file first, so that the app and ENVIRONMENT
// can override as needed.
if (is_file(SYSTEMPATH . 'Config/Routes.php')) {
    require SYSTEMPATH . 'Config/Routes.php';
}

/*
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
// $routes->setAutoRoute(true);
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
// The Auto Routing (Legacy) is very dangerous. It is easy to create vulnerable apps
// where controller filters or CSRF protection are bypassed.
// If you don't want to define all routes, please use the Auto Routing (Improved).
// Set `$autoRoutesImproved` to true in `app/Config/Feature.php` and set the following to true.
//$routes->setAutoRoute(false);

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.
$routes->get('/', 'Dashboard\Dashboard::Index', ['filter' => 'role:admin,bidangbalai']);

//Router Global
$routes->get('/getProgramByBidangbalai', 'Dashboard\Master\Subkegiatan::getProgramByBidangbalai', ['filter' => 'role:admin,bidangbalai']);
$routes->get('/getKegiatanByProgram', 'Dashboard\Master\Subkegiatan::getKegiatanByProgram', ['filter' => 'role:admin,bidangbalai']);
$routes->get('/getSubkegiatanByKegiatan', 'Dashboard\Master\Subkegiatan::getSubkegiatanByKegiatan', ['filter' => 'role:admin,bidangbalai']);


//Router Menu Master (indikator subkegiatan)
$routes->get('/subkegiatan', 'Dashboard\Master\Subkegiatan::Index', ['filter' => 'role:admin,bidangbalai']);
$routes->get('/getIndikatorSubkegiatanByBidangbalai', 'Dashboard\Master\Subkegiatan::getIndikatorSubkegiatanByBidangbalai', ['filter' => 'role:admin,bidangbalai']);
$routes->get('/getIndikatorSubkegiatanById', 'Dashboard\Master\Subkegiatan::getIndikatorSubkegiatanById', ['filter' => 'role:admin,bidangbalai']);
$routes->post('/updateindikatorsubkegiatan', 'Dashboard\Master\Subkegiatan::updateindikatorsubkegiatan', ['filter' => 'role:admin,bidangbalai']);
$routes->post('/addindikatorsubkegiatan', 'Dashboard\Master\Subkegiatan::addindikatorsubkegiatan', ['filter' => 'role:admin,bidangbalai']);
$routes->get('/deleteIndikatorSubkegiatanById', 'Dashboard\Master\Subkegiatan::deleteIndikatorSubkegiatanById', ['filter' => 'role:admin,bidangbalai']);

//Router Menu Master (indikator kegiatan)
$routes->get('/kegiatan', 'Dashboard\Master\Kegiatan::Index', ['filter' => 'role:admin,bidangbalai']);
$routes->get('/getIndikatorkegiatanByBidangbalai', 'Dashboard\Master\Kegiatan::getindikator_kegiatan', ['filter' => 'role:admin,bidangbalai']);
$routes->post('/updateindikatorkegiatan', 'Dashboard\Master\Kegiatan::update_indikator_kegiatan', ['filter' => 'role:admin,bidangbalai']);
$routes->post('/addindikatorkegiatan', 'Dashboard\Master\Kegiatan::add_indikator_kegiatan', ['filter' => 'role:admin,bidangbalai']);
$routes->get('/getIndikatorkegiatanById', 'Dashboard\Master\Kegiatan::get_indikator_kegiatan_byId', ['filter' => 'role:admin,bidangbalai']);
$routes->get('/deleteIndikatorkegiatanById', 'Dashboard\Master\Kegiatan::delete_indikator_kegatan_byId', ['filter' => 'role:admin,bidangbalai']);

/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (is_file(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php')) {
    require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}
