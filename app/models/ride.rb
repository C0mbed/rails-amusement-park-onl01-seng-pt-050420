class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        @attraction = Attraction.find(self.attraction_id)
        @user = User.find(self.user_id)
        if @user.tickets < @attraction.tickets && @user.height < @attraction.min_height
            "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif @user.tickets < @attraction.tickets
            "Sorry. You do not have enough tickets to ride #{@attraction.name}."
        end
        
        if @user.height < @attraction.min_height
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        end

        @user.happiness += @attraction.happiness_rating
        @user.nausea += @attraction.nausea_rating
        @user.tickets -= @attraction.tickets
        @user.save
    end
end

