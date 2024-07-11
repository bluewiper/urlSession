//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by 단예진 on 7/10/24.
//

import UIKit


class ViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
    }
    //서버에서 데이터를 불러오는 메서드 선언
    private func fetchData() {
        
        let defaultUrlSession = URLSession(configuration: .default)
        
        guard let url: URL = URL(string: "https://reqres.in/api/users/1") else {
            print("URL이 잘못되었습니다.")
            return
        }
        
       //URL Request 설정
        var request: URLRequest =  URLRequest(url: url)
        
        request.httpMethod = "GET"
       //주고 받을 데이터 형식이 JSON 데이터 형식임을 나타냄 
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
         
    }
    
    
}



/*
{
  "data": {
    "id": 1,
    "email": "george.bluth@reqres.in",
    "first_name": "George",
    "last_name": "Bluth",
    "avatar": "https://reqres.in/img/faces/1-image.jpg"
  },
  "support": {
    "url": "https://reqres.in/#support-heading",
    "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
  }
}
*/

struct UserData: Codable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: URL
    
    //서버데이터의 firstName은 스네이크 형식으로 되어 있기 때문에 Swift에서 쓰는 camelCase형식으로 치환해준다.
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

struct DataSupport: Codable {
    let url: URL
    let text: String
}

struct ResponseData: Codable {
    let data: UserData
    let support: DataSupport
}
