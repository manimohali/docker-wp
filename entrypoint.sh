#!/bin/sh

# Update wp-config.php with the given configurations
cat <<EOL >> /var/www/html/wp-config.php
define( 'PRINT_SITE_URL', 'https://print.pacificbarcode.com/wp-login.php?action=logout');
define( 'THERMAL_TRANSFER_LABEL_CAT_ID', 632 );
define( 'TT_LABEL_PRODUCT_THUMBNAIL_ID', 24279 );
define('THRRMAL_TRANSFER_RIBBONS_CAT',495);
define( 'FREE_TERM_IDS', 665 );
define( 'INKJET_CAT', 21 );
define( 'MATERIAL', 678 );
define( 'ATTAHMENT_ID', 51589 );
define( 'THERMAL_CAT_ID', 495 );
define( 'Rectangular_ATTACHMENT_ID', 335047 );
define('SITE_ENVIRONMENT', 'LIVE');
EOL

# Run nginx in the background
nginx

# Start php-fpm
exec "$@"