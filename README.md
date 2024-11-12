# ByteCoin

## Description

ByteCoin is a simple and intuitive iOS app that provides real-time Bitcoin price information. Users can view the current price of Bitcoin in a variety of popular global currencies.

## Features

	• Live Bitcoin Price Tracking: See the current Bitcoin price for your selected currency, updated in real-time.
	• Popular Currency Options: Choose from a range of 23 global currencies to view Bitcoin’s latest price.

## Supported Currencies

	• AUD (Australian Dollar)
	• BRL (Brazilian Real)
	• CAD (Canadian Dollar)
	• CNY (Chinese Yuan)
	• EUR (Euro)
	• GBP (British Pound Sterling)
	• HKD (Hong Kong Dollar)
	• IDR (Indonesian Rupiah)
	• ILS (Israeli Shekel)
	• INR (Indian Rupee)
	• JPY (Japanese Yen)
	• MXN (Mexican Peso)
	• NOK (Norwegian Krone)
	• NZD (New Zealand Dollar)
	• PLN (Polish Zloty)
	• RON (Romanian Leu)
	• RUB (Russian Ruble)
	• SEK (Swedish Krona)
	• SGD (Singapore Dollar)
	• USD (United States Dollar)
	• ZAR (South African Rand)

## Setting up Secrets.plist

1. Create a file named `Secrets.plist` in the root of your project.
2. Add the following structure, replacing `YourActualApiKeyGoesHere` with your API key:
```
   <?xml version="1.0" encoding="UTF-8"?>
   <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
   <plist version="1.0">
   <dict>
       <key>API_KEY</key>
       <string>YourActualApiKeyGoesHere</string>
   </dict>
   </plist>
```
This setup will keep your API key secure while allowing others to run your project locally.
