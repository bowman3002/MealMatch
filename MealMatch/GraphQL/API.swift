// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class RestaurantDataQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query RestaurantData($location: String, $top: Int) {
      search(location: $location, limit: $top) {
        __typename
        total
        business {
          __typename
          name
          photos
          url
          display_phone
          review_count
          rating
          price
          categories {
            __typename
            title
          }
          hours {
            __typename
            is_open_now
          }
        }
      }
    }
    """

  public let operationName: String = "RestaurantData"

  public let operationIdentifier: String? = "d9cbe6eb3e7dcc6002e575fb5923786aff99e94a7360b12228f9e696a007ef37"

  public var location: String?
  public var top: Int?

  public init(location: String? = nil, top: Int? = nil) {
    self.location = location
    self.top = top
  }

  public var variables: GraphQLMap? {
    return ["location": location, "top": top]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("search", arguments: ["location": GraphQLVariable("location"), "limit": GraphQLVariable("top")], type: .object(Search.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(search: Search? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "search": search.flatMap { (value: Search) -> ResultMap in value.resultMap }])
    }

    /// Search for businesses on Yelp.
    public var search: Search? {
      get {
        return (resultMap["search"] as? ResultMap).flatMap { Search(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "search")
      }
    }

    public struct Search: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Businesses"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("total", type: .scalar(Int.self)),
          GraphQLField("business", type: .list(.object(Business.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(total: Int? = nil, business: [Business?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Businesses", "total": total, "business": business.flatMap { (value: [Business?]) -> [ResultMap?] in value.map { (value: Business?) -> ResultMap? in value.flatMap { (value: Business) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Total number of businesses found.
      public var total: Int? {
        get {
          return resultMap["total"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "total")
        }
      }

      /// A list of business Yelp finds based on the search criteria.
      public var business: [Business?]? {
        get {
          return (resultMap["business"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Business?] in value.map { (value: ResultMap?) -> Business? in value.flatMap { (value: ResultMap) -> Business in Business(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Business?]) -> [ResultMap?] in value.map { (value: Business?) -> ResultMap? in value.flatMap { (value: Business) -> ResultMap in value.resultMap } } }, forKey: "business")
        }
      }

      public struct Business: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Business"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("photos", type: .list(.scalar(String.self))),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("display_phone", type: .scalar(String.self)),
            GraphQLField("review_count", type: .scalar(Int.self)),
            GraphQLField("rating", type: .scalar(Double.self)),
            GraphQLField("price", type: .scalar(String.self)),
            GraphQLField("categories", type: .list(.object(Category.selections))),
            GraphQLField("hours", type: .list(.object(Hour.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil, photos: [String?]? = nil, url: String? = nil, displayPhone: String? = nil, reviewCount: Int? = nil, rating: Double? = nil, price: String? = nil, categories: [Category?]? = nil, hours: [Hour?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "Business", "name": name, "photos": photos, "url": url, "display_phone": displayPhone, "review_count": reviewCount, "rating": rating, "price": price, "categories": categories.flatMap { (value: [Category?]) -> [ResultMap?] in value.map { (value: Category?) -> ResultMap? in value.flatMap { (value: Category) -> ResultMap in value.resultMap } } }, "hours": hours.flatMap { (value: [Hour?]) -> [ResultMap?] in value.map { (value: Hour?) -> ResultMap? in value.flatMap { (value: Hour) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Name of this business.
        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// URLs of up to three photos of the business.
        public var photos: [String?]? {
          get {
            return resultMap["photos"] as? [String?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "photos")
          }
        }

        /// URL for business page on Yelp.
        public var url: String? {
          get {
            return resultMap["url"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "url")
          }
        }

        /// Phone number of the business formatted nicely to be displayed to users. The format is the standard phone number format for the business's country.
        public var displayPhone: String? {
          get {
            return resultMap["display_phone"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "display_phone")
          }
        }

        /// Number of reviews for this business.
        public var reviewCount: Int? {
          get {
            return resultMap["review_count"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "review_count")
          }
        }

        /// Rating for this business (value ranges from 1, 1.5, ... 4.5, 5).
        public var rating: Double? {
          get {
            return resultMap["rating"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "rating")
          }
        }

        /// Price level of the business. Value is one of $, $$, $$$ and $$$$ or null if we don't have price available for the business.
        public var price: String? {
          get {
            return resultMap["price"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "price")
          }
        }

        /// A list of category title and alias pairs associated with this business.
        public var categories: [Category?]? {
          get {
            return (resultMap["categories"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Category?] in value.map { (value: ResultMap?) -> Category? in value.flatMap { (value: ResultMap) -> Category in Category(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Category?]) -> [ResultMap?] in value.map { (value: Category?) -> ResultMap? in value.flatMap { (value: Category) -> ResultMap in value.resultMap } } }, forKey: "categories")
          }
        }

        /// Opening hours of the business.
        public var hours: [Hour?]? {
          get {
            return (resultMap["hours"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Hour?] in value.map { (value: ResultMap?) -> Hour? in value.flatMap { (value: ResultMap) -> Hour in Hour(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Hour?]) -> [ResultMap?] in value.map { (value: Hour?) -> ResultMap? in value.flatMap { (value: Hour) -> ResultMap in value.resultMap } } }, forKey: "hours")
          }
        }

        public struct Category: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Category"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("title", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(title: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Category", "title": title])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Title of a category for display purposes.
          public var title: String? {
            get {
              return resultMap["title"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "title")
            }
          }
        }

        public struct Hour: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Hours"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("is_open_now", type: .scalar(Bool.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(isOpenNow: Bool? = nil) {
            self.init(unsafeResultMap: ["__typename": "Hours", "is_open_now": isOpenNow])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Describes if the business is open now.
          public var isOpenNow: Bool? {
            get {
              return resultMap["is_open_now"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "is_open_now")
            }
          }
        }
      }
    }
  }
}

public final class ReviewTotalForQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ReviewTotalFor($id: String) {
      reviews(business: $id) {
        __typename
        total
      }
    }
    """

  public let operationName: String = "ReviewTotalFor"

  public let operationIdentifier: String? = "d73c909f04e39fe5ab3e4e2da3c4606dd6f55c0c3b9b2822abe819a0c8fc1416"

  public var id: String?

  public init(id: String? = nil) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("reviews", arguments: ["business": GraphQLVariable("id")], type: .object(Review.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(reviews: Review? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "reviews": reviews.flatMap { (value: Review) -> ResultMap in value.resultMap }])
    }

    /// Load reviews for a specific business.
    public var reviews: Review? {
      get {
        return (resultMap["reviews"] as? ResultMap).flatMap { Review(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "reviews")
      }
    }

    public struct Review: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Reviews"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("total", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(total: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Reviews", "total": total])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Total number of reviews.
      public var total: Int? {
        get {
          return resultMap["total"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "total")
        }
      }
    }
  }
}

public final class DataTopByLocationQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query DataTopByLocation($location: String, $top: Int) {
      search(location: $location, limit: $top) {
        __typename
        total
        business {
          __typename
          name
        }
      }
    }
    """

  public let operationName: String = "DataTopByLocation"

  public let operationIdentifier: String? = "d9c52cfbf2bb62e29f8f350622947c2c215ca7530c23e122571db3301685da02"

  public var location: String?
  public var top: Int?

  public init(location: String? = nil, top: Int? = nil) {
    self.location = location
    self.top = top
  }

  public var variables: GraphQLMap? {
    return ["location": location, "top": top]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("search", arguments: ["location": GraphQLVariable("location"), "limit": GraphQLVariable("top")], type: .object(Search.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(search: Search? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "search": search.flatMap { (value: Search) -> ResultMap in value.resultMap }])
    }

    /// Search for businesses on Yelp.
    public var search: Search? {
      get {
        return (resultMap["search"] as? ResultMap).flatMap { Search(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "search")
      }
    }

    public struct Search: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Businesses"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("total", type: .scalar(Int.self)),
          GraphQLField("business", type: .list(.object(Business.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(total: Int? = nil, business: [Business?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Businesses", "total": total, "business": business.flatMap { (value: [Business?]) -> [ResultMap?] in value.map { (value: Business?) -> ResultMap? in value.flatMap { (value: Business) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Total number of businesses found.
      public var total: Int? {
        get {
          return resultMap["total"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "total")
        }
      }

      /// A list of business Yelp finds based on the search criteria.
      public var business: [Business?]? {
        get {
          return (resultMap["business"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Business?] in value.map { (value: ResultMap?) -> Business? in value.flatMap { (value: ResultMap) -> Business in Business(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Business?]) -> [ResultMap?] in value.map { (value: Business?) -> ResultMap? in value.flatMap { (value: Business) -> ResultMap in value.resultMap } } }, forKey: "business")
        }
      }

      public struct Business: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Business"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Business", "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Name of this business.
        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}
