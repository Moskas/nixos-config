{ config, pkgs, ... }:

{
  services.grocy = {
    enable = true;
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
