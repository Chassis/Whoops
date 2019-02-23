# A Chassis extension to install and configure Whoops on your Chassis server
class whoops (
	$config,
	$path = '/vagrant/extensions/whoops',
) {
	exec { "Installing Whoops with Composer in $path":
		environment => [ 'COMPOSER_HOME=/usr/bin/composer' ],
		path        => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ],
		cwd         => $path,
		command     => 'composer install --no-dev --ignore-platform-reqs',
		require     => [ Exec['install composer'] ],
		unless      => 'bash -c "test -d /vagrant/extensions/whoops/vendor"',
	}
}
