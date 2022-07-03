enum TemplateInstaller {
  installAll('INSTALL_ALL'),
  installRandom('INSTALL_RANDOM'),
  installRandomOnce('INSTALL_RANDOM_ONCE'),
  installBalanced('INSTALL_BALANCED');

  const TemplateInstaller(this.value);
  final String value;

}
