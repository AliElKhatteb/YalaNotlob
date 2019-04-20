class HomeController < ApplicationController
    def index 
        @order = Order.where(user_id: current_user.id).last(5)

        @orderfriend = Order.where(
            user_id: Friendship.select("friend_id")
            .where(user_id: current_user.id)
        ).last(5)

    end
end
