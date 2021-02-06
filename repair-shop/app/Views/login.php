<main class="form-signin">

    <form action="<?= base_url('login') ?>" method="post" class="text-center">
        <?= csrf_field() ?>

        <?php if (isset($error)) : ?>
            <div class="alert alert-danger alert-dismissible fade show mb-4" role="alert">
                Pastikan <strong>nomor pegawai</strong> atau <strong>kata sandi</strong> Anda benar!

                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <?php endif; ?>

        <img class="mb-4" src="icons/site-icon.png" alt="" width="72" height="72">
        <h1 class="h3 mb-3 fw-normal">
            Silakan masuk
        </h1>

        <label for="input-employee-id" class="visually-hidden">
            Nomor Pegawai
        </label>
        <input type="text" id="input-employee-id" name="employee-id" class="form-control" placeholder="Nomor Pegawai" required autofocus autocomplete="off" value="K001">

        <label for="input-password" class="visually-hidden">
            Kata Sandi
        </label>
        <input type="password" id="input-password" name="password" class="form-control" placeholder="Kata Sandi" required value="kasir01">

        <button class="w-100 btn btn-lg btn-primary" type="submit">
            Masuk
        </button>

        <footer class="mt-3 text-muted">
            &copy;1439 Bengkel Motor
        </footer>

    </form>

</main>
