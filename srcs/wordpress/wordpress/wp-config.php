<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'data' );

/** MySQL database username */
define( 'DB_USER', 'harlock' );

/** MySQL database password */
define( 'DB_PASSWORD', 'user42' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'J8*lPy 6 HbhDrakQGe3_pz36ws(oPv!+A>^>xv@j:gY?^W+MMJJ~+1xy^UVq;|g' );
define( 'SECURE_AUTH_KEY',  'peOyvJVw/^&o-7,c}rR]9@k;37UM65oL-y`w9P&;W`Mtb<kfFI,a+!6Dyqe25Gr$' );
define( 'LOGGED_IN_KEY',    'jQ&P(|O+`ay$[~@]kJ<TikVYJp5oq3r2!Y, zC}tQ#5by!DuDC/b5Et,-Nt>)~Md' );
define( 'NONCE_KEY',        'G$eEd_sCv*-lUVtT-]BpeEt&?kv_||T N*&%f``rN.%P00F#/0rt>U:mPG?$St({' );
define( 'AUTH_SALT',        '5$mE,0?Y*C2;c-c@); DZScjWkOGLW+~uICl5t;=]Cxf-$m=%EYU*)/^m*?LV}1C' );
define( 'SECURE_AUTH_SALT', ';eOC01Zz)dPBiI@+7jic</8V|6DMx`[lXi{VBlZN~MW{Ee X_n^uh`SVpIu6ROZR' );
define( 'LOGGED_IN_SALT',   'B=@lMCLV$-.2v2v)8`=6c/8Z,8DBx$}j2?)&Z$ne+>q*KecUUfK`H@rVi9(Bu5}^' );
define( 'NONCE_SALT',       '5|)|X^/b^xQ6Bds|uNhi*2x>:zekbW9l_k8zVF2[zjr}!;Fu^l6~%|>!#cwZ1JYH' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
