# updates the site-wide default date display to Month Day, Year
Date::DATE_FORMATS[:default] = "%B %e, %Y"

# creates a new custom Date format that we can call anywhere throughout the app case-by-case
Date::DATE_FORMATS[:release_date] = "%B %e, %Y"
