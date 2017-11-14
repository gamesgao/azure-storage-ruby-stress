require "azure/storage"
require_relative "core_converter"
require_relative "../infrastructure/logging_aspect"
require_relative "../utils.rb"


module Azure
  module Storage
    module Converter
      class QueueConverter
        def QueueConverter.getQueueService(handler, accountInfo)
          storageService = Azure::Storage::Converter::CoreConverter.getStorageService(handler, accountInfo)
          return storageService.queue_client
        end


        def QueueConverter.convertQueueMessageToThriftQueueMessage(message)
          result = Azure::Storage::AutoGenerated::ThriftQueueMessage.new
          if message.nil?
            result.messageId = ""
            result.popReceipt = ""
            result.insertionTime = 0
            result.expirationTime = 0
            result.nextVisibleTime = 0
            result.dequeueCount = 0
            result.payload = ""
            return result
          else
            result.messageId = message.id
            result.popReceipt = message.pop_receipt
            result.insertionTime = Azure::Storage::Utilities::timeStringToInteger(message.insertion_time)
            result.expirationTime = Azure::Storage::Utilities::timeStringToInteger(message.expiration_time)
            result.nextVisibleTime = Azure::Storage::Utilities::timeStringToInteger(message.time_next_visible)
            result.dequeueCount = message.dequeue_count
            result.payload = message.message_text
            return result
          end
        end
      end
    end
  end
end