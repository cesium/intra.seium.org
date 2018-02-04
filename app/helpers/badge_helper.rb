module BadgeHelper
    def col_for_badges(bagdes)
        bagdes.length == 1 ? 'col-md-12' : 'col-md-6'
    end
end
