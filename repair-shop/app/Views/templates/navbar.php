<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="<?= base_url('dashboard'); ?>">
            <img src="<?= base_url('icons/site-icon.png'); ?>" width="30" height="30" alt="Logo Bengkel Motor" class="me-2">
            Bengkel Motor
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-supported-content" aria-controls="navbar-supported-content" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbar-supported-content">
            <span class="me-auto"></span>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <div class="btn btn-sm my-1 ps-0 me-2">
                        <span data-feather="user"></span>
                        <?= ucfirst(session('permission')); ?> / <?= ucfirst(session('employeeId')); ?>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="btn btn-sm btn-outline-danger my-1" href="<?= base_url('logout'); ?>">
                        <span data-feather="log-out"></span>
                        Keluar
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
