
public enum RequestMethod {
    case POST
    case GET
    case PUT
    case DELETE
}


public struct HTTPRequest {
    
    public var host: String
    
    public var port: Int
    
    public var path: String
    
    public var method: RequestMethod
    
    public var headers: [String: String]
    
    var body: String?
    
    public init(host: String, path: String) {
        self.host = host
        self.path = path
        self.port = 80
        self.method = .GET
        self.headers = [:]
    }

    public init(host: String, path: String, port: Int) {
        self.host = host
        self.path = path
        self.port = port
        self.method = .GET
        self.headers = [:]
    }

    public init(host: String, path: String, method: RequestMethod) {
        self.host = host
        self.path = path
        self.port = 80
        self.method = method
        self.headers = [:]
    }

    public init(host: String, path: String, port: Int, method: RequestMethod) {
        self.host = host
        self.path = path
        self.port = port
        self.method = method
        self.headers = [:]
    }
    
    public init(host: String, path: String, port: Int, method: RequestMethod, headers: [String: String]) {
        self.host = host
        self.path = path
        self.port = port
        self.method = method
        self.headers = headers
    }
}
