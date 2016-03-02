import Ocean
import Echo
import Foundation

public enum RequestError: ErrorType {
    case Failed
}

public class HTTP {
    
    public static func request(request: HTTPRequest) -> (response: HTTPResponse?, body: String?, error: ErrorType?) {
        do {
            let response = try sendRequest(request)
            return (response: response, body: response.body, error: nil)
        } catch {
            return (response: nil, body: nil, error: error)
        }
    }
    
    public static func request(request: HTTPRequest, handler: (response: HTTPResponse?, body: String?, error: ErrorType?) -> ()) {
        dispatch_async(dispatch_get_global_queue(0, 0)) {
            let result = self.request(request)
            handler(response: result.response, body: result.body, error: result.error)
        }
    }
}

extension HTTP {
    
    static func sendRequest(request: HTTPRequest) throws -> HTTPResponse {
        
        let socket = try Socket()
        
        try socket.connect(request.host, port: Int16(request.port))

        socket.write("\(request.method) \(request.path) HTTP/1.1\r\n")

        var headers: [String: String] = ["Host": request.host, 
            "Connection": "close"]

        for (key, value) in request.headers {
            headers[key] = value
        }
        
        for (key, value) in headers {
            socket.write("\(key): \(value)\r\n")
        }
        
        socket.write("\r\n")
        
        if let body = request.body {
            socket.write(body)
        }

        let parser = HTTPParser(socket: socket)
        let response = try parser.parse()
        return response
    }
}
