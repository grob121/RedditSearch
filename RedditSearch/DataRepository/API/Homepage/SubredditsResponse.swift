import Foundation
import ObjectMapper

open class SubredditsResponse: Mappable {
    public var kind: String?
    public var data: Data?

    public init(
        kind: String,
        data: Data) {
        self.kind = kind
        self.data = data
    }

    public required init?(map: Map) { }

    open func mapping(map: Map) {
        kind <- map["kind"]
        data <- map["data"]
    }
}

open class Data: Mappable {
    public var after: String?
    public var dist: Int?
    public var modhash: String?
    public var geo_filter: String?
    public var children: [Children]?
    public var before: String?

    public init() { }

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        after <- map["after"]
        dist <- map["dist"]
        modhash <- map["modhash"]
        geo_filter <- map["geo_filter"]
        children <- map["children"]
        before <- map["before"]
    }
}

open class Children: Mappable {
    public var kind: String?
    public var data: ChildrenData?

    public init() { }

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        kind <- map["kind"]
        data <- map["data"]
    }
}

open class ChildrenData: Mappable {
    public var approved_at_utc: String?
    public var subreddit: String?
    public var selftext: String?
    public var author_fullname: String?
    public var saved: Bool?
    public var mod_reason_title: String?
    public var gilded: Int?
    public var clicked: Bool?
    public var title: String?
    public var link_flair_richtext: [String]?
    public var subreddit_name_prefixed: String?
    public var hidden: Bool?
    public var pwls: Int?
    public var link_flair_css_class: String?
    public var downs: Int?
    public var thumbnail_height: String?
    public var top_awarded_type: String?
    public var hide_score: Bool?
    public var name: String?
    public var quarantine: Bool?
    public var link_flair_text_color: String?
    public var upvote_ratio: Double?
    public var author_flair_background_color: String?
    public var subreddit_type: String?
    public var ups: Int?
    public var total_awards_received: Int?
    public var media_embed: MediaEmbed?
    public var thumbnail_width: String?
    public var author_flair_template_id: String?
    public var is_original_content: Bool?
    public var user_reports: [String]?
    public var secure_media: String?
    public var is_reddit_media_domain: Bool?
    public var is_meta: Bool?
    public var category: String?
    public var secure_media_embed: SecureMediaEmbed?
    public var link_flair_text: String?
    public var can_mod_post: Bool?
    public var score: Int?
    public var approved_by: String?
    public var is_created_from_ads_ui: Bool?
    public var author_premium: Bool?
    public var thumbnail: String?
    public var edited: Bool?
    public var author_flair_css_class: String?
    public var author_flair_richtext: [String]?
    public var gildings: Gildings?
    public var content_categories: String?
    public var is_self: Bool?
    public var mod_note: String?
    public var created: Double?
    public var link_flair_type: String?
    public var wls: Int?
    public var removed_by_category: String?
    public var banned_by: String?
    public var author_flair_type: String?
    public var domain: String?
    public var allow_live_comments: Bool?
    public var selftext_html: String?
    public var likes: String?
    public var suggested_sort: String?
    public var banned_at_utc: String?
    public var view_count: String?
    public var archived: Bool?
    public var no_follow: Bool?
    public var is_crosspostable: Bool?
    public var pinned: Bool?
    public var over_18: Bool?
    public var all_awardings: [AllAwardings]?
    public var awarders: [String]?
    public var media_only: Bool?
    public var can_gild: Bool?
    public var spoiler: Bool?
    public var locked: Bool?
    public var author_flair_text: String?
    public var treatment_tags: [String]?
    public var visited: Bool?
    public var removed_by: String?
    public var num_reports: String?
    public var distinguished: String?
    public var subreddit_id: String?
    public var author_is_blocked: Bool?
    public var mod_reason_by: String?
    public var removal_reason : String?
    public var link_flair_background_color: String?
    public var id: String?
    public var is_robot_indexable: Bool?
    public var report_reasons: String?
    public var author: String?
    public var discussion_type: String?
    public var num_comments: Int?
    public var send_replies: Bool?
    public var whitelist_status: String?
    public var contest_mode: Bool?
    public var mod_reports: [String]?
    public var author_patreon_flair: Bool?
    public var author_flair_text_color: String?
    public var permalink: String?
    public var parent_whitelist_status: String?
    public var stickied: Bool?
    public var url: String?
    public var subreddit_subscribers: Int?
    public var created_utc: Double?
    public var num_crossposts: Int?
    public var media: String?
    public var is_video: Bool?

    public init() { }

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        approved_at_utc <- map["approved_at_utc"]
        subreddit <- map["subreddit"]
        selftext <- map["selftext"]
        author_fullname <- map["author_fullname"]
        saved <- map["saved"]
        mod_reason_title <- map["mod_reason_title"]
        gilded <- map["gilded"]
        clicked <- map["clicked"]
        title <- map["title"]
        link_flair_richtext <- map["link_flair_richtext"]
        subreddit_name_prefixed <- map["subreddit_name_prefixed"]
        hidden <- map["hidden"]
        pwls <- map["pwls"]
        link_flair_css_class <- map["link_flair_css_class"]
        downs <- map["downs"]
        thumbnail_height <- map["thumbnail_height"]
        top_awarded_type <- map["top_awarded_type"]
        hide_score <- map["hide_score"]
        name <- map["name"]
        quarantine <- map["quarantine"]
        link_flair_text_color <- map["link_flair_text_color"]
        upvote_ratio <- map["upvote_ratio"]
        author_flair_background_color <- map["author_flair_background_color"]
        subreddit_type <- map["subreddit_type"]
        ups <- map["ups"]
        total_awards_received <- map["total_awards_received"]
        media_embed <- map["media_embed"]
        thumbnail_width <- map["thumbnail_width"]
        author_flair_template_id <- map["author_flair_template_id"]
        is_original_content <- map["is_original_content"]
        user_reports <- map["user_reports"]
        secure_media <- map["secure_media"]
        is_reddit_media_domain <- map["is_reddit_media_domain"]
        is_meta <- map["is_meta"]
        category <- map["category"]
        secure_media_embed <- map["secure_media_embed"]
        link_flair_text <- map["link_flair_text"]
        can_mod_post <- map["can_mod_post"]
        score <- map["score"]
        approved_by <- map["approved_by"]
        is_created_from_ads_ui <- map["is_created_from_ads_ui"]
        author_premium <- map["author_premium"]
        thumbnail <- map["thumbnail"]
        edited <- map["edited"]
        author_flair_css_class <- map["author_flair_css_class"]
        author_flair_richtext <- map["author_flair_richtext"]
        gildings <- map["gildings"]
        content_categories <- map["content_categories"]
        is_self <- map["is_self"]
        mod_note <- map["mod_note"]
        created <- map["created"]
        link_flair_type <- map["link_flair_type"]
        wls <- map["wls"]
        removed_by_category <- map["removed_by_category"]
        banned_by <- map["banned_by"]
        author_flair_type <- map["author_flair_type"]
        domain <- map["domain"]
        allow_live_comments <- map["allow_live_comments"]
        selftext_html <- map["selftext_html"]
        likes <- map["likes"]
        suggested_sort <- map["suggested_sort"]
        banned_at_utc <- map["banned_at_utc"]
        view_count <- map["view_count"]
        archived <- map["archived"]
        no_follow <- map["no_follow"]
        is_crosspostable <- map["is_crosspostable"]
        pinned <- map["pinned"]
        over_18 <- map["over_18"]
        all_awardings <- map["all_awardings"]
        awarders <- map["awarders"]
        media_only <- map["media_only"]
        can_gild <- map["can_gild"]
        spoiler <- map["spoiler"]
        locked <- map["locked"]
        author_flair_text <- map["author_flair_text"]
        treatment_tags <- map["treatment_tags"]
        visited <- map["visited"]
        removed_by <- map["removed_by"]
        num_reports <- map["num_reports"]
        distinguished <- map["distinguished"]
        subreddit_id <- map["subreddit_id"]
        author_is_blocked <- map["author_is_blocked"]
        mod_reason_by <- map["mod_reason_by"]
        removal_reason <- map["removal_reason"]
        link_flair_background_color <- map["link_flair_background_color"]
        id <- map["id"]
        is_robot_indexable <- map["is_robot_indexable"]
        report_reasons <- map["report_reasons"]
        author <- map["author"]
        discussion_type <- map["discussion_type"]
        num_comments <- map["num_comments"]
        send_replies <- map["send_replies"]
        whitelist_status <- map["whitelist_status"]
        contest_mode <- map["contest_mode"]
        mod_reports <- map["mod_reports"]
        author_patreon_flair <- map["author_patreon_flair"]
        author_flair_text_color <- map["author_flair_text_color"]
        permalink <- map["permalink"]
        parent_whitelist_status <- map["parent_whitelist_status"]
        stickied <- map["stickied"]
        url <- map["url"]
        subreddit_subscribers <- map["subreddit_subscribers"]
        created_utc <- map["created_utc"]
        num_crossposts <- map["num_crossposts"]
        media <- map["media"]
        is_video <- map["is_video"]
    }
}

open class MediaEmbed: Mappable {
    public init() { }

    public required init?(map: Map) { }

    public func mapping(map: Map) { }
}

open class SecureMediaEmbed: Mappable {
    public init() { }

    public required init?(map: Map) { }

    public func mapping(map: Map) { }
}

open class Gildings: Mappable {
    public var gid_1: Int?
    
    public init() { }

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        gid_1 <- map["gid_1"]
    }
}

open class AllAwardings: Mappable {
    public var giver_coin_reward: String?
    public var subreddit_id: String?
    public var is_new: Bool?
    public var days_of_drip_extension: Int?
    public var coin_price: Int?
    public var id: String?
    public var penny_donate: String?
    public var award_sub_type: String?
    public var coin_reward: Int?
    public var icon_url: String?
    public var days_of_premium: Int?
    public var tiers_by_required_awardings: String?
    public var resized_icons: [ResizedIcons]?
    public var icon_width: Int?
    public var static_icon_width: Int?
    public var start_date: String?
    public var is_enabled: Bool?
    public var awardings_required_to_grant_benefits: String?
    public var description: String?
    public var end_date: String?
    public var subreddit_coin_reward: Int?
    public var count: Int?
    public var static_icon_height: Int?
    public var name: String?
    public var resized_static_icons: [ResizedStaticIcons]?
    public var icon_format: String?
    public var icon_height: Int?
    public var penny_price: String?
    public var award_type: String?
    public var static_icon_url: String?
    
    public init() { }

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        giver_coin_reward <- map["giver_coin_reward"]
        subreddit_id <- map["subreddit_id"]
        is_new <- map["is_new"]
        days_of_drip_extension <- map["days_of_drip_extension"]
        coin_price <- map["coin_price"]
        id <- map["id"]
        penny_donate <- map["penny_donate"]
        award_sub_type <- map["award_sub_type"]
        coin_reward <- map["coin_reward"]
        icon_url <- map["icon_url"]
        days_of_premium <- map["days_of_premium"]
        tiers_by_required_awardings <- map["tiers_by_required_awardings"]
        resized_icons <- map["resized_icons"]
        icon_width <- map["icon_width"]
        static_icon_width <- map["static_icon_width"]
        start_date <- map["start_date"]
        is_enabled <- map["is_enabled"]
        awardings_required_to_grant_benefits <- map["awardings_required_to_grant_benefits"]
        description <- map["description"]
        end_date <- map["end_date"]
        subreddit_coin_reward <- map["subreddit_coin_reward"]
        count <- map["count"]
        static_icon_height <- map["static_icon_height"]
        name <- map["name"]
        resized_static_icons <- map["resized_static_icons"]
        icon_format <- map["icon_format"]
        icon_height <- map["icon_height"]
        penny_price <- map["penny_price"]
        award_type <- map["award_type"]
        static_icon_url <- map["static_icon_url"]
    }
}

open class ResizedIcons: Mappable {
    public var url: String?
    public var width: Int?
    public var height: Int?
    
    public init() { }

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        url <- map["url"]
        width <- map["width"]
        height <- map["height"]
    }
}

open class ResizedStaticIcons: Mappable {
    public var url: String?
    public var width: Int?
    public var height: Int?
    
    public init() { }

    public required init?(map: Map) { }

    public func mapping(map: Map) {
        url <- map["url"]
        width <- map["width"]
        height <- map["height"]
    }
}
