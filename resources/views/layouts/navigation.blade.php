<ul class="sidebar-nav sidebar-dark sidebar-fixed" data-coreui="navigation" data-simplebar>
    <li class="nav-item">
        <a class="nav-link" href="{{ route('home') }}">
            <svg class="nav-icon">
                <use xlink:href="{{ asset('icons/coreui.svg#cil-view-quilt') }}"></use>
            </svg>
            {{ __('Dashboard') }}
        </a>
    </li>

    <li class="nav-group" aria-expanded="false">
        <a class="nav-link nav-group-toggle" href="#">
            <svg class="nav-icon">
                <use xlink:href="{{ asset('icons/coreui.svg#cil-truck') }}"></use>
            </svg>
            Dostawa na magazyn
        </a>
        <ul class="nav-group-items" style="height: 0px;">
            <li class="nav-item">
                <a class="nav-link" href="{{ route('shipments.create') }}" target="_top">
                    Nowa dostawa
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{{ route('shipments.index') }}" target="_top">
                    Dokumenty przyjęcia
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" target="_top">
                    Kontrola dostawy
                </a>
            </li>
        </ul>
    </li>
    <li class="nav-group" aria-expanded="false">
        <a class="nav-link nav-group-toggle" href="#">
            <svg class="nav-icon">
                <use xlink:href="{{ asset('icons/coreui.svg#cil-truck') }}"></use>
            </svg>
           Wydanie z magazynu
        </a>
        <ul class="nav-group-items" style="height: 0px;">
            <li class="nav-item">
                <a class="nav-link" href="#" target="_top">
                    Dokumenty wydania
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" target="_top">
                    Planowanie kompletacji
                </a>
            </li>
        </ul>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="{{ route('about') }}">
            <svg class="nav-icon">
                <use xlink:href="{{ asset('icons/coreui.svg#cil-clipboard') }}"></use>
            </svg>
            Kompletacja
        </a>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="{{ route('about') }}">
            <svg class="nav-icon">
                <use xlink:href="{{ asset('icons/coreui.svg#cil-industry') }}"></use>
            </svg>
            Inwentaryzacja
        </a>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="{{ route('firms.index') }}">
            <svg class="nav-icon">
                <use xlink:href="{{ asset('icons/coreui.svg#cil-group') }}"></use>
            </svg>
            Kontrahenci
        </a>
    </li>

    <li class="nav-group" aria-expanded="false">
        <a class="nav-link nav-group-toggle" href="#">
            <svg class="nav-icon">
                <use xlink:href="{{ asset('icons/coreui.svg#cil-3d') }}"></use>
            </svg>
            Budowa magazynu
        </a>
        <ul class="nav-group-items" style="height: 0px;">
            <li class="nav-item">
                <a class="nav-link" href="{{ route('locations.index') }}" target="_top">
                    Lokalizacja
                </a>
        </ul>
    </li>

    <li class="nav-group" aria-expanded="false">
        <a class="nav-link nav-group-toggle" href="#">
            <svg class="nav-icon">
                <use xlink:href="{{ asset('icons/coreui.svg#cil-spreadsheet') }}"></use>
            </svg>
            Produkty
        </a>
        <ul class="nav-group-items" style="height: 0px;">
            <li class="nav-item">
                <a class="nav-link" href="{{ route('products.index') }}" target="_top">
                    Definicja produktów
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{{ route('producttypes.index') }}" target="_top">
                    Kategoria produktów
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{{ route('productmetrics.index') }}" target="_top">
                    Jednostka miary
                </a>
            </li>
        </ul>
    </li>
    <li class="nav-group" aria-expanded="false">
        <a class="nav-link nav-group-toggle" href="#">
            <svg class="nav-icon">
                <use xlink:href="{{ asset('icons/coreui.svg#cil-inbox') }}"></use>
            </svg>
            Opakowania
        </a>
        <ul class="nav-group-items" style="height: 0px;">
            <li class="nav-item">
                <a class="nav-link" href="{{ route('storeunits.index') }}" target="_top">
                    Definicja opakowań
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{{ route('storeunittypes.index') }}" target="_top">
                    Rodzaj opakowań
                </a>
            </li>
        </ul>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="{{ route('users.index') }}">
            <svg class="nav-icon">
                <use xlink:href="{{ asset('icons/coreui.svg#cil-people') }}"></use>
            </svg>
            Pracownicy
        </a>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="{{ route('about') }}">
            <svg class="nav-icon">
                <use xlink:href="{{ asset('icons/coreui.svg#cil-address-book') }}"></use>
            </svg>
            {{ __('About us') }}
        </a>
    </li>
</ul>
