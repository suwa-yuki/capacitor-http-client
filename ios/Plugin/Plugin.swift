import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitor.ionicframework.com/docs/plugins/ios
 */
@objc(HTTPClient)
public class HTTPClient: CAPPlugin {
    
    @objc func request(_ call: CAPPluginCall) {
        let urlString = call.getString("url") ?? ""
        let methodString = call.getString("method") ?? ""
        let bodyDictionary = call.getObject("body") ?? [:]
        let headersDictionary = call.getObject("headers") ?? [:]

        print(urlString)
        print(methodString)
        print(bodyDictionary)
        print(headersDictionary)

        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = methodString
        
        if (methodString == "post") {
            do {
                let body = try JSONSerialization.data(withJSONObject: bodyDictionary)
                let bodyString = String(bytes: body, encoding: .utf8)!
                print(bodyString)
                request.httpBody = body
            } catch (let e) {
                print(e)
            }
        }

        for (key, value) in headersDictionary {
            if let valueString = value as? String {
                request.addValue(valueString, forHTTPHeaderField: key)
            }
        }
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if error == nil, let data = data, let response = response as? HTTPURLResponse {
                print("Content-Type: \(response.allHeaderFields["Content-Type"] ?? "")")
                print("StatusCode: \(response.statusCode)")
                let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
                call.success([
                    "data": json
                ])
            }
        }.resume()
    }
}
