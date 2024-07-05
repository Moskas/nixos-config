{ ... }:

{
  services.grocy = {
    enable = true;
    hostName = "laffey.home";
    nginx.enableSSL = false;
    settings = {
      currency = "PLN";
      culture = "pl";
      calendar = {
        showWeekNumber = true;
        firstDayOfWeek = 1;
      };
    };
  };
}
