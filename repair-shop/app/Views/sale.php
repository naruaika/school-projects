<main role="main" class="container mb-2">

    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center py-3 mt-3">
        <h2 class="h2">
            <?= esc($title); ?>
            <span class="badge rounded-pill bg-secondary">
                <span data-feather="key" style="height: 30px"></span>
                <?= esc($kode_transaksi); ?>
            </span>
        </h2>
    </div>

    <div class="row">
        <div class="col-lg-6 col-md-12">
            <h5>
                <span data-feather="bookmark" style="height: 20px"></span>
                Informasi Umum
            </h5>

            <div class="row">
                <div class="col-lg-6 col-md-12">
                    <label for="input-timestamp-begin" class="mb-2">
                        Cap Waktu Mulai
                    </label>
                    <input type="datetime" id="input-timestamp-begin" class="form-control" value="<?= esc($tgl_masuk) ?? '-'; ?>" readonly>
                </div>

                <div class="col-lg-6 col-md-12">
                    <label for="input-timestamp-end" class="mb-2">
                        Cap Waktu Selesai
                    </label>
                    <input type="datetime" id="input-timestamp-end" class="form-control" value="<?= esc($tgl_keluar) ?? '-'; ?>" readonly>
                </div>
            </div>
        </div>
    </div>

    <hr>

    <div class="row">
        <div class="col-lg-6 col-md-12">
            <h5>
                <span data-feather="shopping-cart" style="height: 20px"></span>
                Keranjang
            </h5>
            <?php if ($cartItems) : ?>
                <div class="table-responsive">
                    <table class="table table-sm table-striped table-light border mb-0">
                        <?php if ($status == 'sedang') : ?>
                            <caption><strong>Catatan:</strong> Mintalah akses ke admin jika ingin menghapus entri atau membatalkan transaksi.</caption>
                        <?php endif; ?>

                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Nomor</th>
                                <th>Nama Barang</th>
                                <th style="text-align: center;">Qty</th>
                                <th style="text-align: right;">Subtotal (Rp)</th>

                                <?php if ($status == 'sedang') : ?>
                                    <th style="width: 50px;"></th>
                                <?php endif; ?>
                            </tr>
                        </thead>

                        <tbody>
                            <?php $no = 1;
                            $totalSales = 0;
                            foreach ($cartItems as $row) :
                                $total = $row['het'] * $row['qty'];
                                $totalSales += $total; ?>
                                <tr>
                                    <th><?= esc($no++); ?></th>
                                    <td><?= esc($row['nomor_suku_cadang']); ?></td>
                                    <td><?= esc($row['nama_suku_cadang']); ?></td>
                                    <td style="text-align: center;"><?= esc($row['qty']); ?></td>
                                    <td style="text-align: right;"><?= number_format($total, 0, ',', '.'); ?></td>

                                    <?php if ($status == 'sedang') : ?>
                                        <td style="text-align: right;">
                                            <button type="button" class="btn btn-outline-danger btn-sm me-1" onclick="location.href=''">
                                                <span data-feather="trash-2"></span>
                                            </button>
                                        </td>
                                    <?php endif; ?>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>

                        <tfoot>
                            <tr class="table-success">
                                <th colspan="3">Harga Total</th>
                                <td colspan="2" style='text-align: right; font-weight: bold;'>Rp<?= number_format($totalSales, 0, ',', '.'); ?></td>

                                <?php if ($status == 'sedang') : ?>
                                    <td></td>
                                <?php endif; ?>
                            </tr>
                        </tfoot>
                    </table>
                </div>

                <?php if ($status == 'sedang') : ?>
                    <div class="alert alert-warning alert-dismissible fade show mb-0" role="alert">
                        <strong>Peringatan:</strong> Barang yang sudah dibeli tidak dapat dikembalikan. Mohon pastikan barang tidak memiliki cacat sebelum diserahkan kepada pembeli!
                    </div>
                <?php endif; ?>
            <?php else :
                echo 'Kosong.';
            endif; ?>
        </div>

        <?php if ($status == 'sedang') : ?>
            <div class="col-lg-6 col-md-12">
                <h5>
                    <span data-feather="search" style="height: 20px"></span>
                    Cari Suku Cadang
                </h5>
                <div class="mb-3">
                    <input type="search" id="input-query" class="form-control" placeholder="Tikkan nama atau nomor suku cadang ..." onkeyup="searchParts()" autofocus>
                </div>

                <div class="table-responsive">
                    <table class="table table-sm table-striped border">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Nomor</th>
                                <th>Nama Barang</th>
                                <th style="text-align: right;">HET (Rp)</th>
                                <th style="text-align: center;">Stok</th>
                                <th style="width: 96px;"></th>
                            </tr>
                        </thead>

                        <tbody id="search-result">
                            <tr>
                                <th>...</th>
                                <td>...</td>
                                <td>...</td>
                                <td style="text-align: right;">...</td>
                                <td style="text-align: center;">...</td>
                                <td style="text-align: right;">...</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        <?php endif; ?>
    </div>

    <hr>

    <div class="row mb-3">
        <div class="col-lg-6 col-md-6">
            <h5>
                <span data-feather="credit-card" style="height: 20px"></span>
                Pembayaran
            </h5>
            <table class="table table-sm table-light border w-100 mb-0">
                <tbody>
                    <tr>
                        <td style="vertical-align: middle;">Suku Cadang</td>
                        <td style="text-align: right;">
                            Rp<?= number_format(($totalSales ?? 0), 0, ',', '.'); ?>
                        </td>
                    </tr>

                    <tr>
                        <td style="vertical-align: middle;">Diskon</td>
                        <td>
                            <div class="input-group input-group-sm ms-auto" style="width: 130px;">
                                <span class="input-group-text">Rp</span>
                                <input type="number" id="input-discount" class="form-control" value="0" min="0" onclick="this.select();" onkeyup="countChange();" required>
                            </div>
                        </td>
                    </tr>
                </tbody>

                <tfoot>
                    <tr class="table-success">
                        <th style="vertical-align: middle;">Total Belanja</th>

                        <?php $grandTotal = $totalSales ?? 0; ?>
                        <th style="text-align: right;">
                            Rp<?= number_format(($grandTotal ?? 0), 0, ',', '.'); ?>
                        </th>
                    </tr>

                    <tr>
                        <td style="vertical-align: middle;">Uang Bayar</td>
                        <td>
                            <div class="input-group input-group-sm ms-auto" style="width: 130px;">
                                <span class="input-group-text">Rp</span>
                                <input type="number" id="input-pay" class="form-control" value="0" min="0" onclick="this.select();" onkeyup="countChange();" required>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <th style="vertical-align: middle;">Kembalian</th>
                        <th style="text-align: right;">
                            Rp<span id="input-change">0</span>
                        </th>
                    </tr>
                </tfoot>
            </table>

            <?php if ($status == 'sedang') : ?>
                <div class="alert alert-warning alert-dismissible fade show mb-0 mt-3" role="alert">
                    <strong>Peringatan:</strong> Transaksi yang telah selesai tidak dapat dibatalkan. Mohon pastikan uang bayar telah Anda terima sebelum menekan tombol selesai!
                </div>
            <?php endif; ?>
        </div>
    </div>

    <?php if ($status == 'sedang') : ?>
        <button class="btn btn-outline-danger me-2 mb-2" onclick="location.href='<?= base_url('sale/cancel/' . $kode_transaksi) ?>'">
            <span data-feather="x-circle"></span>
            Batal
        </button>

        <button class="btn btn-success me-2 mb-2" onclick="sellCartItems()">
            <span data-feather="dollar-sign"></span>
            Selesai
        </button>

    <?php elseif ($status == 'selesai') : ?>
        <button class="btn btn-primary me-2 mb-2" onclick="location.href='<?= base_url('sale/print/' . $kode_transaksi) ?>'">
            <span data-feather="printer"></span>
            Cetak
        </button>
    <?php endif; ?>

</main>

<script>
    <?php if ($status == 'sedang') : ?>
        function searchParts() {
            const query = document.getElementById('input-query').value;
            if (query.length >= 3) {
                let xhttp = new XMLHttpRequest();
                xhttp.open('GET', "<?= base_url('sparepart/search?query=') ?>" + query, true);
                xhttp.onload = function() {
                    if (this.response && this.status === 200) {
                        let line = '';
                        JSON.parse(this.response).forEach(row => {
                            line += '<tr>';
                            line += '<th>' + row.kode_suku_cadang + '</th>';
                            line += '<td>' + row.nomor_suku_cadang + '</td>';
                            line += '<td>' + row.nama_suku_cadang + '</td>';
                            line += '<td style="text-align: right;">' + row.het.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.') + '</td>';
                            line += '<td style="text-align: center;">' + row.stok + '</td>';

                            line += '<td>';
                            line += '<div class="input-group">';

                            line += '<input id="input-qty-' + row.kode_suku_cadang + '" type="number" name="qty" class="form-control form-control-sm" value="0" min="0" max="' + row.stok + '">';

                            line += '<button class="btn btn-outline-primary btn-sm" onclick="addCartItem(' + row.kode_suku_cadang + ')"><span data-feather="plus"></span></button>';

                            line += '</div>';
                            line += '</td>';
                            line += '</tr>';
                        });
                        document.getElementById('search-result').innerHTML = line;
                        feather.replace();
                    } else {
                        document.getElementById('search-result').innerHTML = "<tr><td>...</td><td>...</td><td>...</td><td style='text-align: right;'>...</td><td style='text-align: center;'>...</td><td  style='text-align: right;'>...</td></tr>";
                    }
                }
                xhttp.send();
            }
        }

        function addCartItem(partId) {
            const qty = document.getElementById('input-qty-' + partId).value;
            if (qty > 0) {
                let xhttp = new XMLHttpRequest();
                xhttp.open('POST', "<?= base_url('sale/add/' . $kode_transaksi); ?>", true);
                xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhttp.onreadystatechange = function() {
                    if (this.response && this.status === 200) {
                        location.reload(true);
                    }
                }
                xhttp.send('partId=' + partId + '&qty=' + qty);
            }
        }

        function sellCartItems() {
            let xhttp = new XMLHttpRequest();
            xhttp.open('GET', "<?= base_url('sale/confirm/' . $kode_transaksi) ?>", true);
            xhttp.onload = function() {
                if (this.response && this.status === 200) {
                    location.reload(true);
                }
            }
            xhttp.send();
        }

        function countChange() {
            document.getElementById('input-change').innerText = (
                document.getElementById('input-pay').value - <?= $grandTotal; ?>)
                .toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.');
        }
    <?php endif; ?>
</script>
