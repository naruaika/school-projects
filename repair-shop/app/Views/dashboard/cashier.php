<main role="main" class="container mb-2">

    <div class="py-3 mt-3">
        <h2 class="h2">
            <?= esc($title); ?>
            <span class="badge rounded-pill bg-secondary">
                <span data-feather="calendar" style="height: 30px"></span>
                <?= date('Y-m-d'); ?>
            </span>
        </h2>
    </div>

    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-2 border-bottom">
        <h5>
            <span data-feather="tool" style="height: 20px"></span>
            Daftar Reparasi
        </h5>
        <div class="btn-toolbar mb-2 mb-md-0">
            <button class="btn btn-primary" onclick="location.href='<?= base_url('repair'); ?>'">
                <span data-feather="plus" style="height: 20px"></span>
                Reparasi Baru
            </button>
        </div>
    </div>

    <?php if ($reparations) : ?>
        <div class="table-responsive">
            <table class="table table-sm table-striped">
                <thead>
                    <tr>
                        <th style="text-align: left; width: 0px; min-width: 30px">#</th>
                        <th style="width: 180px;">Cap Waktu</th>
                        <th style="width: 130px;">Nomor Polisi</th>
                        <th>Keluhan</th>
                        <th style="width: 130px;">Biaya (Rp)</th>
                        <th style="width: 100px;">Status</th>
                        <th style="width: 0px;"></th>
                    </tr>
                </thead>

                <tbody>
                    <?php foreach ($reparations as $row) :
                        if ($row['status'] != 'batal') : ?>
                            <tr>
                                <th style="vertical-align: middle; text-align: left;"><?= esc($row['kode_transaksi']); ?></th>
                                <td style="vertical-align: middle;"><?= esc($row['tgl_masuk']); ?></td>
                                <td style="vertical-align: middle;"><?= esc($row['no_polisi']); ?></td>
                                <td style="vertical-align: middle;"><?= '-'; ?></td>
                                <td style="vertical-align: middle;">-</td>

                                <td style="vertical-align: middle; font-size: 1.15em">
                                    <?php if ($row['status'] == 'sedang') : ?>
                                        <span class="badge rounded-pill bg-warning text-dark">
                                            <?= esc(ucfirst($row['status'])); ?>
                                        </span>
                                    <?php else: ?>
                                        <span class="badge rounded-pill bg-success">
                                            <?= esc(ucfirst($row['status'])); ?>
                                        </span>
                                    <?php endif; ?>
                                </td>

                                <td style="text-align: right;">
                                    <button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='<?= base_url('repair/' . esc($row['kode_transaksi'])); ?>'">
                                        <?php if ($row['status'] == 'sedang') : ?>
                                            <span data-feather="edit"></span>
                                        <?php else: ?>
                                            <span data-feather="info"></span>
                                        <?php endif; ?>
                                    </button>
                                </td>
                            </tr>
                    <?php endif;
                    endforeach; ?>
                </tbody>
            </table>
        </div>
    <?php else :
        echo 'Kosong.';
    endif; ?>

    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-2 border-bottom">
        <h5>
            <span data-feather="shopping-bag" style="height: 20px"></span>
            Daftar Penjualan
        </h5>
        <div class="btn-toolbar mb-2 mb-md-0">
            <button class="btn btn-primary" onclick="location.href='<?= base_url('sale'); ?>'">
                <span data-feather="plus" style="height: 20px"></span>
                Penjualan Baru
            </button>
        </div>
    </div>

    <?php if ($purchases) : ?>
        <div class="table-responsive">
            <table class="table table-sm table-striped" style="white-space: nowrap;">
                <thead>
                    <tr>
                        <th style="text-align: left; width: 0px; min-width: 30px">#</th>
                        <th style="width: 180px;">Cap Waktu</th>
                        <th>Daftar Barang</th>
                        <th style="width: 130px;">Biaya (Rp)</th>
                        <th style="width: 100px;">Status</th>
                        <th style="width: 0px;"></th>
                    </tr>
                </thead>

                <tbody>
                    <?php foreach ($purchases as $row) : ?>
                        <tr>
                            <th style="vertical-align: middle; text-align: left;"><?= esc($row['kode_transaksi']); ?></th>
                            <td style="vertical-align: middle;"><?= esc($row['tgl_keluar']) ?? '-'; ?></td>
                            <td style="vertical-align: middle;"><?= mb_strimwidth(esc($row['daftar_suku_cadang']), 0, 50, '...') ?? '-'; ?></td>
                            <td style="vertical-align: middle;"><?= number_format(esc($row['harga_total']), 0, ',', '.') ?? '-'; ?></td>

                            <td style="vertical-align: middle; font-size: 1.15em">
                                <?php if ($row['status'] == 'sedang') : ?>
                                    <span class="badge rounded-pill bg-warning text-dark">
                                        <?= esc(ucfirst($row['status'])); ?>
                                    </span>
                                <?php else: ?>
                                    <span class="badge rounded-pill bg-success">
                                        <?= esc(ucfirst($row['status'])); ?>
                                    </span>
                                <?php endif; ?>
                            </td>

                            <td style="text-align: right;">
                                <button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='<?= base_url('sale/' . esc($row['kode_transaksi'])); ?>'">
                                    <?php if ($row['status'] == 'sedang') : ?>
                                        <span data-feather="edit"></span>
                                    <?php else: ?>
                                        <span data-feather="info"></span>
                                    <?php endif; ?>
                                </button>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    <?php else :
        echo 'Kosong.';
    endif; ?>

</main>
