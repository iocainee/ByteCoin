import Foundation
import CoreLocation

protocol CoinManagerDelegate {
    func didSelectRow(rate: Float, currency: String)
    func didFailWithError(_ error: Error)
}

class CoinManager {
    var delegate: CoinManagerDelegate?

    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let currencyArray = ["AUD", "BRL", "CAD", "CNY", "EUR", "GBP", "HKD", "IDR", "ILS", "INR", "JPY", "MXN", "NOK", "NZD", "PLN", "RON", "SEK", "SGD", "USD", "ZAR"]
    
    private var apiKey: String? {
        guard let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
              let dict = NSDictionary(contentsOfFile: path) as? [String: Any],
              let key = dict["API_KEY"] as? String else {
            return nil
        }
        return key
    }
    
    func getCoinPrice(for currency: String) {
        
        guard let apiKey = apiKey else {
                    print("API Key is missing")
                    return
                }
        
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    self.delegate?.didFailWithError(error)
                    return
                }

                if let safeData = data, let coinData = self.parseJSON(safeData) {
                    self.delegate?.didSelectRow(rate: coinData.rate, currency: currency)
                }
            
            }
            task.resume()
        }
    }

    func parseJSON(_ data: Data) -> CoinData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            return decodedData
        } catch {
            print("Decoding Error: \(error)")
            delegate?.didFailWithError(error)
            return nil
        }
    }
}
