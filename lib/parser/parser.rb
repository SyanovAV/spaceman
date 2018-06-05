# class Parser
#   include Requests::RequestsLogger
#   cattr_accessor :client
#   require 'message_bus/connection'
#   require 'json'
#   require 'active_support/all'
#   require 'rexml/document'
#   require 'nokogiri'
#   include REXML
#
#   def initialize
#
#   end
#
#   def parser!
#     queue = Connection.load_incoming_queue_settings()[:name]
#     @@bus_logger.info("starting listen queue: #{queue}")
#     self.client.subscribe(queue, ack: :client) do |message|
#       @@bus_logger.info("incoming message: #{queue}")
#       m = ActiveSupport::HashWithIndifferentAccess.new(JSON.parse(message.body))
#       processable = self.handlers.map{|x| x.can_process?(m)}
#       unless processable.any?
#         @@bus_logger.warn("WARNING! Unprocessable requests: #{m}")
#       else
#         self.handlers.each do |h|
#           if h.can_process?(m)
#             begin
#               h.process(m)
#               self.client.acknowledge(message)
#             rescue PG::UnableToSend, PG::ConnectionBad
#               sleep 5
#               exit
#             rescue ActiveRecord::StatementInvalid => e
#               exit if e.cause.class.in?([PG::UnableToSend, PG::ConnectionBad, PG::AdminShutdown])
#               raise e
#             rescue => e
#               Airbrake.notify(e)
#               puts e.backtrace
#             end
#           end
#         end
#       end
#       @@bus_logger.warn("Message: #{m}")
#       self.client.acknowledge(message)
#       @@bus_logger.info("end message: #{queue}")
#     end
#   end
#
# end
#
#
#
#
#
#
#
#
#
#
#
#
# filelog = File.new("servicemix.log")
# filemessage = File.new("Test.log", "w+")
# #filemessage1 = File.new("Test.log")
# ammofile = File.new("ammo.txt", "w")
# uprdu = 0
# accreditation = 0
# accreditation2 = 0
# hotel = 0
# catering = 0
# schedule = 0
# volunteer = 0
# contracts = 0
# portal = 0
# media = 0
# guide = 0
# promo_volunteers = 0
# suz = 0
# opendj_ui = 0
# transport = 0
# command = 0
# nsi = 0
# ugames = 0
# skud = 0
# support = 0
# booking = 0
# str = 0
#
# filelog.each_with_index do |line, i|
#   if line.match(/(New message .*)/)
#     filemessage.puts(line)
#   end
# end
# filemessage.close
#
# filemessage = File.open("Test.log")
# filemessage.each_with_index do |line, i|
#   message = line.match(/{.*}/).to_s
#   next if message == ''
#   m = JSON.parse(message)
#   str += 1
#   if (m["message_type"].in?(%w(create_hotel_building_type update_hotel_building_type delete_hotel_building_type
#      create_hotel_building update_hotel_building delete_hotel_building create_hotel_floor update_hotel_floor
#      delete_hotel_floor create_hotel_room_class update_hotel_room_class delete_hotel_room_class create_hotel_room_type
#      update_hotel_room_type delete_hotel_room_type create_room update_room delete_room create_program_module update_program_module
#      delete_program_module create_role update_role delete_role create_user update_user delete_user create_user_role update_user_role delete_user_role))) ||
#       (m["message_type"].in?(%w(member_update)) && (m["prev_status_code"].in?(%w(active) || m["status_code"].in?(%w(active))))) ||
#       (m["message_type"].in?(%w(create_item update_item delete_item recovery_item)) && (m["dictionary_id"].in?(%w(6 7 8 15 16 20 23 28 29 30 31 32 49 53 54 55))))
#     uprdu += 1
#   end
#
#   if (m["message_type"].in?(%w(create_item update_item delete_item recovery_item))) &&
#       (m["dictionary_id"].in?(%w(5 7 9 11 12 13 15 16 18 19 20 21 22 23 29 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 56 60 55 61 62 65 66 67 69)))
#     accreditation += 1
#   end
#
#   if m["message_type"].in?(%w(create_user update_user delete_user create_user_role update_user_role delete_user_role create_program_module update_program_module
#      delete_program_module create_role update_role delete_role create_booking update_booking delete_booking update_flight_data))
#     accreditation2 += 1
#   end
#
#   if (m["message_type"].in?(%w(create_program_module update_program_module delete_program_module create_role update_role delete_role create_user
#      update_user delete_user create_user_role update_user_role delete_user_role))) ||
#       (m["message_type"].in?(%w(member_update)) && (m["prev_status_code"].in?(%w(active) || m["status_code"].in?(%w(active))))) ||
#       (m["message_type"].in?(%w(create_item update_item delete_item recovery_item)) && (m["dictionary_id"].in?(%w(4 7 15 16 19 22 23 49))))
#     hotel += 1
#   end
#
#   if (m["message_type"].in?(%w(create_village_building update_village_building delete_village_building create_hotel_building update_hotel_building
#      delete_hotel_building create_contractor update_contractor delete_contractor create_program_module update_program_module delete_program_module
#      create_role update_role delete_role create_user update_user delete_user create_user_role update_user_role delete_user_role update_volunteers_number))) ||
#       (m["message_type"].in?(%w(member_update)) && (m["prev_status_code"].in?(%w(active) || m["status_code"].in?(%w(active))))) ||
#       (m["message_type"].in?(%w(create_item update_item delete_item recovery_item)) && (m["dictionary_id"].in?(%w(5 7 16 29 44 47)))) ||
#       (m["message_type"].in?(%w(create_event update_event delete_event)) && (m["category_event"].in?(%w(c_event))))
#     catering += 1
#   end
#
#   if (m["message_type"].in?(%w(create_village_building update_village_building delete_village_building create_village_floor update_village_floor
#      delete_village_floor create_playground update_playground delete_playground create_user update_user delete_user create_program_module
#      update_program_module delete_program_module create_user_role update_user_role delete_user_role create_role update_role delete_role
#      create_hotel_building update_hotel_building delete_hotel_building delete_village_room))) ||
#       ((m["message_type"].in?(%w(create_village_room)) || m["message_type"].in?(%w(update_village_room))) &&
#           (m.dig("village_room_attributes", "room_type_name").in?(%w(conference meeting_room Конференц-зал Переговорная)))) ||
#       (m["message_type"].in?(%w(member_update)) && (m["prev_status_code"].in?(%w(active) || m["status_code"].in?(%w(active)))) && m["code"].in?(%w(VOL)) == false) ||
#       (m["prev_status_code"].in?(%w(active) || m["status_code"].in?(%w(active)))) ||
#       (m["message_type"].in?(%w(create_item update_item delete_item recovery_item)) && (m["dictionary_id"].in?(%w(5 7 19 20 21 29 49 54 15 18 16 67 68))))
#     schedule += 1
#   end
#
#   if (m["message_type"].in?(%w(uniform_status,create_hq update_hq delete_hq create_village_room update_village_room delete_village_room create_village_building
#      update_village_building delete_village_building create_program_module update_program_module delete_program_module create_role update_role delete_role create_user
#      update_user delete_user create_user_role update_user_role delete_user_role))) ||
#       (m["message_type"].in?(%w(member_update)) && m["code"].in?(%w(VOL)) && ((m["prev_status_code"].in?(%w(active)) || m["prev_status_code"].in?(%w(rejected))) ||
#           ((m["status_code"].in?(%w(active)) || m["status_code"].in?(%w(rejected)))))) || m["message_type"].in?(%w(update_booking)) ||
#       (m["message_type"].in?(%w(create_item update_item delete_item recovery_item)) && (m["dictionary_id"].in?(%w(5 7 10 20 23 24 25 26 27 29 31 32 4)))) ||
#       ((m["message_type"].in?(%w(create_item update_item delete_item recovery_item)) && m["dictionary_id"].in?(%w(8,16))) && m.dig["item_attributes", "code"].in?(%w(VOL))) ||
#       (m["message_type"].in?(%w(create_item update_item delete_item recovery_item)) && m["dictionary_id"].in?(%w(17,18)) && m.dig["item_attributes", "code"].in?(%w(supervisor volunteer team_leader))) ||
#       (m["message_type"].in?(%w(create_event update_event delete_event)) && (m["category_event"].in?(%w(c_event t_event training ceremony))))
#     volunteer += 1
#   end
#
#   if (m["message_type"].in?(%w(create_user update_user delete_user create_program_module update_program_module delete_program_module create_user_role update_user_role
#      delete_user_role create_role update_role delete_role create_doc_advanta create_doc_companymedia))) ||
#       (m["message_type"].in?(%w(create_item update_item delete_item recovery_item)) && m["dictionary_id"].in?(%w(7,47,58)))
#     contracts += 1
#   end
#
#   if (m["message_type"].in?(%w(create_volunteer_news update_volunteer_news delete_volunteer_news update_results create_other_object update_other_object delete_other_object
#      create_hotel_building update_hotel_building delete_hotel_building create_transport_category update_transport_category delete_transport_category create_program_module
#      update_program_module delete_program_module create_role update_role delete_role create_user update_user delete_user create_user_role update_user_role delete_user_role))) ||
#       (m["message_type"].in?(%w(member_update)) && m["code"].in?(%w(SPORT)) && (m["prev_status_code"].in?(%w(active)) || m["status_code"].in?(%w(active)))) ||
#       (m["message_type"].in?(%w(create_item update_item delete_item recovery_item)) && (m["dictionary_id"].in?(%w(7 19 20 21 29)))) ||
#       (m["message_type"].in?(%w(create_event update_event delete_event)) && (m["category_event"].in?(%w(c_event))))
#     portal += 1
#   end
#
#   if (m["message_type"].in?(%w(member_update create_program_module update_program_module delete_program_module create_role update_role delete_role create_user update_user
#      delete_user create_user_role update_user_role delete_user_role create_news update_news delete_news create_event update_event delete_event))) ||
#       (m["message_type"].in?(%w(create_item update_item delete_item recovery_item)) && (m["dictionary_id"].in?(%w(5 7 18 20 23 29 40 56))))
#     media += 1
#   end
#
#   if (m["message_type"].in?(%w(create_news update_news delete_news create_sport_type update_sport_type delete_sport_type create_object update_object delete_object
#      create_album update_album delete_album create_video update_video delete_video update_mobile_info_page update_results member_update))) ||
#       (m["message_type"].in?(%w(create_item update_item delete_item recovery_item)) && (m["dictionary_id"].in?(%w(4 5 7 10 19 20 33 801 802 803 804 29 28)))) ||
#       (m["message_type"].in?(%w(create_event update_event delete_event)) && (m["category_event"].in?(%w(c_event))))
#     guide += 1
#   end
#
#   if (m["message_type"].in?(%w(create_program_module update_program_module delete_program_module create_role update_role delete_role create_user update_user delete_user
#      create_user_role update_user_role delete_user_role))) || (m["message_type"].in?(%w(create_item update_item delete_item recovery_item)) && (m["dictionary_id"].in?(%w(7 8 17 25 27))))
#     promo_volunteers += 1
#   end
#
#   if (m["message_type"].in?(%w(create_program_module update_program_module delete_program_module create_role update_role delete_role create_user update_user delete_user
#      create_user_role update_user_role delete_user_role))) || (m["message_type"].in?(%w(create_item update_item delete_item recovery_item)) && (m["dictionary_id"].in?(%w(25 7))))
#     suz += 1
#   end
#
#   if (m["message_type"].in?(%w(create_item update_item delete_item recovery_item)) && (m["dictionary_id"].in?(%w(7 15 24)))) ||
#       (m["message_type"].in?(%w(create_organization update_organization delete_organization create_hotel_building update_hotel_building delete_hotel_building create_contractor
#       update_contractor delete_contractor create_hotel_group update_hotel_group delete_hotel_group)))
#     opendj_ui += 1
#   end
#
#   if (m["message_type"].in?(%w(create_village_building update_village_building delete_village_building create_sport_object update_sport_object delete_sport_object create_hotel_building
#      update_hotel_building delete_hotel_building))) ||
#       (m["message_type"].in?(%w(member_update)) && m["code"].in?(%w(IORG)) && m["status_code"].in?(%w(active))) ||
#       (m["message_type"].in?(%w(create_item update_item delete_item recovery_item)) && (m["dictionary_id"].in?(%w(7 5 19 6 8 15 16 17 18 10 20 28 29 44 39 40)))) ||
#       (m["message_type"].in?(%w(create_event update_event delete_event)) && (m["category_event"].in?(%w(c_event training t_event))))
#     transport += 1
#   end
#
#   if (m["message_type"].in?(%w(update_results create_event update_event delete_event create_hotel building update_hotel building delete_hotel_building create_village_building
#      update_village_building delete_village_building create_incident update_incident delete_incident create_vn_incident create_program_module update_program_module delete_program_module
#      create_role update_role delete_role create_user update_user delete_user create_user_role update_user_role delete_user_role create_village_room update_village_room delete_village_room))) ||
#       (m["message_type"].in?(%w(create_item update_item delete_item recovery_item)) && (m["dictionary_id"].in?(%w(4 5 7 15 16 18 19 20 21 23 25 27 29 54 67 68))))
#     command += 1
#   end
#
#   if m["message_type"].in?(%w(create_user,update_user,delete_user,create_user_role,update_user_role,delete_user_role,create_program_module,update_program_module,delete_program_module,create_role,update_role,delete_role))
#     nsi += 1
#   end
#
#   if (m["message_type"].in?(%w(create_user update_user delete_user create_user_role update_user_role delete_user_role create_program_module update_program_module delete_program_module create_role update_role delete_role))) ||
#       (m["message_type"].in?(%w(member_update)) && (m["prev_status_code"].in?(%w(active)) == false && m["status_code"].in?(%w(active)))) ||
#       (m["message_type"].in?(%w(create_item update_item delete_item recovery_item)) && (m["dictionary_id"].in?(%w(5 7 15 16 18 20 23 40 44)))) ||
#       (m["message_type"].in?(%w(create_event update_event delete_event)) && (m["category_event"].in?(%w(c_event training t_event))))
#     ugames += 1
#   end
#
#   if m["message_type"].in?(%w(member_update)) && (m["prev_status_code"].in?(%w(active)) || m["status_code"].in?(%w(active)))
#     skud += 1
#   end
#
#   if m["message_type"].in?(%w(create_item update_item delete_item recovery_item)) && (m["dictionary_id"].in?(%w(7)))
#     support += 1
#   end
#
#   if (m["message_type"].in?(%w(create_program_module update_program_module delete_program_module create_role update_role delete_role create_user update_user delete_user create_user_role update_user_role delete_user_role))) ||
#       (m["message_type"].in?(%w(create_item update_item delete_item recovery_item)) && (m["dictionary_id"].in?(%w(7))))
#     booking += 1
#   end
#   p str
#   size_message = message.bytesize
#   ammomessage = ("POST /cxf/rest/api/activemq/send HTTP/1.1
# Host: esb-int-test01.uni2019.fil-it.ru:8181
# content-type: application/json
# content-length: "+size_message.to_s+"
# authorization: Basic YWR2YW50YTpYUVFjVTBScDdN
#
# " + message + "
#
#   ")
#
#   size = ammomessage.bytesize
#   ammofile.puts(size)
#   ammofile.puts(ammomessage)
# end
#
# p 'uprdu', uprdu
# p 'accreditation', accreditation
# p 'accreditation2', accreditation2
# p 'hotel', hotel
# p 'catering', catering
# p 'schedule', schedule
# p 'volunteer', volunteer
# p 'contracts', contracts
# p 'portal', portal
# p 'media', media
# p 'guide', guide
# p 'promo_volunteers', promo_volunteers
# p 'suz', suz
# p 'opendj_ui', opendj_ui
# p 'transport', transport
# p 'command', command
# p 'nsi', nsi
# p 'ugames', ugames
# p 'skud', skud
# p 'support', support
# p 'booking', booking