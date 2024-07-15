struct Issue: Codable {
    var filePath: String
    var title: String
    var rawTitle: String
    var body: String

    init(_ filePath: String, _ title: String, _ rawTitle: String, _ body: String) {
        self.filePath = filePath
        self.title = title
        self.rawTitle = rawTitle
        self.body = body
    }

    func toUrlQuery() -> String {
        var query = "?"
        query += "title=\(self.title)"
        query += "&"
        query += "body=\(self.body)"

        return query.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
    }
}

extension Issue: CustomStringConvertible {
    var description: String {
        let txt = """
        \(BYEL)-- Issue:\(RESET)
        \(UCYN)file:\(RESET)
        \(self.filePath)
        \(UCYN)title:\(RESET)
        \(self.title)
        \(UCYN)body:\(RESET)
        \(self.body)

        """
        return txt 
    }
}
