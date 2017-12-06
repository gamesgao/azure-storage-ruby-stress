require_relative "base_handler"
require_relative "../utils"
require_relative "../auto_generated/cloud_queue_service"
require_relative "../converter/core_converter"
require_relative "../converter/queue_converter"
require_relative "../infrastructure/logging_aspect"

# TODO: use base64 encoding for the message texts
# TODO: setPermission cannot run
# TODO: time needs to be converted
# TODO: log
# TODO: Add requestInfoFilter to service.

module Azure::Storage::Stress
  module Handler
    class CloudQueueHandler < BaseHandler
      def create(requestInfo, accountInfo, createIfNotExists, metadata)
        queueClient = XSS::Converter::QueueConverter.getQueueService(self, accountInfo)
        # ==== Construct Parameters ==== #
        queueName = requestInfo.queueName
        reqOptions = XSS::Converter::CoreConverter.getRequestOptions(requestInfo.thriftRequestOptions)
        reqOptions.merge! XSS::Converter::CoreConverter::getOperationContextOptions(requestInfo.thriftOperationContext)
        reqOptions[:metadata] = metadata unless metadata.nil?

        # ==== Operation ==== #
        if createIfNotExists
          queueList = queueClient.list_queues(prefix: queueName, max_results: 1)
          if queueList.empty?
            temp = queueClient.create_queue(queueName, reqOptions)
          else
            if queueList[0].name == queueName
              temp = nil
            else
              temp = queueClient.create_queue(queueName, reqOptions)
            end
          end
        else
          temp = queueClient.create_queue(queueName, reqOptions)
        end

        # ==== Construct Return Value ==== #
        result = XSS::AutoGenerated::CreateQueueResponse.new
        result.created = temp.nil?
        result.response = XSS::AutoGenerated::CloudQueueResponse.new # no place to find this
        result.response.name = queueName
        result.response.metadata = {}
        return result
      end

      def deleteQueue(requestInfo, accountInfo, deleteIfExists)
        queueClient = XSS::Converter::QueueConverter.getQueueService(self, accountInfo)
        # ==== Construct Parameters ==== #
        queueName = requestInfo.queueName
        reqOptions = XSS::Converter::CoreConverter.getRequestOptions(requestInfo.thriftRequestOptions)
        reqOptions.merge! XSS::Converter::CoreConverter::getOperationContextOptions(requestInfo.thriftOperationContext)

        # ==== Operation ==== #
        if deleteIfExists
          queueList = queueClient.list_queues(prefix: queueName, max_results: 1)
          if queueList.empty?
            temp = queueClient.delete_queue(queueName, reqOptions)
          else
            if queueList[0].name == queueName
              temp = nil
            else
              temp = queueClient.delete_queue(queueName, reqOptions)
            end
          end
        else
          temp = queueClient.delete_queue(queueName, reqOptions)
        end

        # ==== Construct Return Value ==== #
        result = temp.nil?
        return result
      end

      def exists(requestInfo, accountInfo)
        queueClient = XSS::Converter::QueueConverter.getQueueService(self, accountInfo)
        # ==== Construct Parameters ==== #
        queueName = requestInfo.queueName
        reqOptions = XSS::Converter::CoreConverter.getRequestOptions(requestInfo.thriftRequestOptions)
        reqOptions.merge! XSS::Converter::CoreConverter::getOperationContextOptions(requestInfo.thriftOperationContext)
        reqOptions[:prefix] = queueName
        reqOptions[:max_results] = 1

        # ==== Operation ==== #
        temp = queueClient.list_queues(reqOptions)

        # ==== Construct Return Value ==== #
        result = XSS::AutoGenerated::QueueExistsResponse.new
        result.exists = (temp[0].name == queueName)
        result.response = XSS::AutoGenerated::CloudQueueResponse.new # no place to find this
        result.response.name = queueName
        result.response.metadata = {}
        return result
      end

      def clearMessages(requestInfo, accountInfo)
        queueClient = XSS::Converter::QueueConverter.getQueueService(self, accountInfo)
        # ==== Construct Parameters ==== #
        queueName = requestInfo.queueName
        reqOptions = XSS::Converter::CoreConverter.getRequestOptions(requestInfo.thriftRequestOptions)
        reqOptions.merge! XSS::Converter::CoreConverter::getOperationContextOptions(requestInfo.thriftOperationContext)

        # ==== Operation ==== #
        # retry?
        temp = queueClient.clear_messages(queueName, reqOptions)

        # ==== Construct Return Value ==== #
        return
      end

      def fetchAttributes(requestInfo, accountInfo)
        queueClient = XSS::Converter::QueueConverter.getQueueService(self, accountInfo)
        # ==== Construct Parameters ==== #
        queueName = requestInfo.queueName
        reqOptions = XSS::Converter::CoreConverter.getRequestOptions(requestInfo.thriftRequestOptions)
        reqOptions.merge! XSS::Converter::CoreConverter::getOperationContextOptions(requestInfo.thriftOperationContext)

        # ==== Operation ==== #
        temp = queueClient.get_queue_metadata(queueName, reqOptions)

        # ==== Construct Return Value ==== #
        result = XSS::AutoGenerated::CloudQueueResponse.new
        result.name = queueName
        result.metadata = temp[1]
        result.ApproximateMessageCount = temp[0]
        result.storageUri = nil
        return result
      end

      def setMetadata(requestInfo, accountInfo, metadata)
        queueClient = XSS::Converter::QueueConverter.getQueueService(self, accountInfo)
        # ==== Construct Parameters ==== #
        queueName = requestInfo.queueName
        reqOptions = XSS::Converter::CoreConverter.getRequestOptions(requestInfo.thriftRequestOptions)
        reqOptions.merge! XSS::Converter::CoreConverter::getOperationContextOptions(requestInfo.thriftOperationContext)

        # ==== Operation ==== #
        temp = queueClient.set_queue_metadata(queueName, metadata, reqOptions)

        # ==== Construct Return Value ==== #
        return
      end

      def addMessage(addMessagePayload, accountInfo)
        queueClient = XSS::Converter::QueueConverter.getQueueService(self, accountInfo)
        # ==== Construct Parameters ==== #
        requestInfo = addMessagePayload.requestInfo
        queueName = requestInfo.queueName
        reqOptions = XSS::Converter::CoreConverter.getRequestOptions(requestInfo.thriftRequestOptions)
        reqOptions.merge! XSS::Converter::CoreConverter::getOperationContextOptions(requestInfo.thriftOperationContext)
        mseeageText = addMessagePayload.payload
        XSS::Infrastructure::LoggingAspect.logger.debug addMessagePayload.initialVisibilityDelay
        XSS::Infrastructure::LoggingAspect.logger.debug addMessagePayload.timeToLive
        reqOptions[:visibility_timeout] = XSS::Utilities::timeSpanToSecond(addMessagePayload.initialVisibilityDelay) unless addMessagePayload.initialVisibilityDelay < 0
        reqOptions[:message_ttl] = XSS::Utilities::timeSpanToSecond(addMessagePayload.timeToLive)  unless addMessagePayload.timeToLive < 0

        # ==== Operation ==== #
        temp = queueClient.create_message(queueName, mseeageText, reqOptions)

        # ==== Construct Return Value ==== #
        result = XSS::AutoGenerated::CreateMessageResponse.new
        unless temp.empty?
          result.messageId = temp[0].id
          result.popReceipt = temp[0].pop_receipt
          result.insertionTime = XSS::Utilities::timeStringToInteger(temp[0].insertion_time)
          result.expirationTime = XSS::Utilities::timeStringToInteger(temp[0].expiration_time)
          result.nextVisibleTime = XSS::Utilities::timeStringToInteger(temp[0].time_next_visible)
        end
        return result
      end

      def updateMessage(updateMessagePayload, accountInfo, visibilityTimeout, updateFields)
        queueClient = XSS::Converter::QueueConverter.getQueueService(self, accountInfo)
        # ==== Construct Parameters ==== #
        requestInfo = updateMessagePayload.requestInfo
        queueName = requestInfo.queueName
        reqOptions = XSS::Converter::CoreConverter.getRequestOptions(requestInfo.thriftRequestOptions)
        reqOptions.merge! XSS::Converter::CoreConverter::getOperationContextOptions(requestInfo.thriftOperationContext)
        messageId = updateMessagePayload.messageId
        popReceipt = updateMessagePayload.popReceipt
        mseeageText = updateMessagePayload.content
        visibilityTimeout = visibilityTimeout

        # ==== Operation ==== #
        temp = queueClient.update_message(queueName, messageId, popReceipt, messageText, visibilityTimeout, reqOptions)

        # ==== Construct Return Value ==== #
        result = XSS::AutoGenerated::UpdateMessageResponse.new
        result.popReceipt = temp[0]
        result.nextVisibleTime = XSS::Utilities::timeStringToInteger(temp[1])
        return result
      end

      def getMessage(requestInfo, accountInfo, visibilityTimeout)
        queueClient = XSS::Converter::QueueConverter.getQueueService(self, accountInfo)
        # ==== Construct Parameters ==== #
        queueName = requestInfo.queueName
        visibilityTimeout = XSS::Utilities::timeSpanToSecond(visibilityTimeout < 0 ? 0 : visibilityTimeout)
        reqOptions = XSS::Converter::CoreConverter.getRequestOptions(requestInfo.thriftRequestOptions)
        reqOptions.merge! XSS::Converter::CoreConverter::getOperationContextOptions(requestInfo.thriftOperationContext)

        # ==== Operation ==== #
        temp = queueClient.list_messages(queueName, nil, reqOptions)

        # ==== Construct Return Value ==== #
        result = XSS::Converter::QueueConverter.convertQueueMessageToThriftQueueMessage(temp[0])
        return result
      end

      def peekMessage(requestInfo, accountInfo)
        queueClient = XSS::Converter::QueueConverter.getQueueService(self, accountInfo)
        # ==== Construct Parameters ==== #
        queueName = requestInfo.queueName
        reqOptions = XSS::Converter::CoreConverter.getRequestOptions(requestInfo.thriftRequestOptions)
        reqOptions.merge! XSS::Converter::CoreConverter::getOperationContextOptions(requestInfo.thriftOperationContext)

        # ==== Operation ==== #
        temp = queueClient.peek_messages(queueName, reqOptions)

        # ==== Construct Return Value ==== #
        result = QueueConverter.convertQueueMessageToThriftQueueMessage(temp[0])
        return result
      end
      def getMessages(requestInfo, accountInfo, visibilityTimeout, messageCount)
        queueClient = XSS::Converter::QueueConverter.getQueueService(self, accountInfo)
        # ==== Construct Parameters ==== #
        queueName = requestInfo.queueName
        visibilityTimeout = XSS::Utilities::timeSpanToSecond(visibilityTimeout)
        reqOptions = XSS::Converter::CoreConverter.getRequestOptions(requestInfo.thriftRequestOptions)
        reqOptions.merge! XSS::Converter::CoreConverter::getOperationContextOptions(requestInfo.thriftOperationContext)
        reqOptions[:number_of_messages] = messageCount

        # ==== Operation ==== #
        temp = queueClient.list_messages(queueName, visibilityTimeout, reqOptions)

        # ==== Construct Return Value ==== #
        result = []
        temp.each do |message|
          entry = QueueConverter.convertQueueMessageToThriftQueueMessage(message)
          result.push(entry)
        end
        return result
      end

      def peekMessages(requestInfo, accountInfo, messageCount)
        queueClient = XSS::Converter::QueueConverter.getQueueService(self, accountInfo)
        # ==== Construct Parameters ==== #
        queueName = requestInfo.queueName
        reqOptions = XSS::Converter::CoreConverter.getRequestOptions(requestInfo.thriftRequestOptions)
        reqOptions.merge! XSS::Converter::CoreConverter::getOperationContextOptions(requestInfo.thriftOperationContext)
        reqOptions[:number_of_messages] = messageCount

        # ==== Operation ==== #
        temp = queueClient.peek_messages(queueName, reqOptions)

        # ==== Construct Return Value ==== #
        result = []
        temp.each do |message|
          entry = QueueConverter.convertQueueMessageToThriftQueueMessage(message)
          result.push(entry)
        end
        return result
      end

      def deleteMessage(requestInfo, accountInfo, messageId, popReceipt)
        queueClient = XSS::Converter::QueueConverter.getQueueService(self, accountInfo)
        # ==== Construct Parameters ==== #
        queueName = requestInfo.queueName
        messageId = messageId
        popReceipt = popReceipt
        reqOptions = XSS::Converter::CoreConverter.getRequestOptions(requestInfo.thriftRequestOptions)
        reqOptions.merge! XSS::Converter::CoreConverter::getOperationContextOptions(requestInfo.thriftOperationContext)

        # ==== Operation ==== #
        queueClient.delete_message(queueName, messageId, popReceipt, reqOptions)

        # ==== Construct Return Value ==== #
        return
      end

      def setPermissions(requestInfo, accountInfo, permissions)
        queueClient = XSS::Converter::QueueConverter.getQueueService(self, accountInfo)
        # ==== Construct Parameters ==== #
        queueName = requestInfo.queueName
        reqOptions = XSS::Converter::CoreConverter.getRequestOptions(requestInfo.thriftRequestOptions)
        reqOptions.merge! XSS::Converter::CoreConverter::getOperationContextOptions(requestInfo.thriftOperationContext)
        signedIdentifiers = []
        permissions.each do |permission|
          signedIdentifier = XSS::Service::SignedIdentifier.new
          signedIdentifier.access_policy.expiry = XSS::Utilities::timeStampToTime(permissions[permission].expiryTime)
          signedIdentifier.access_policy.permission = permissions[permission].permissions
          signedIdentifier.access_policy.start = XSS::Utilities::timeStampToTime(permissions[permission].startTime)
          signedIdentifier.id = permission
          signedIdentifiers.push(signedIdentifier)
        end
        reqOptions[:signed_identifiers] = signedIdentifiers

        # ==== Operation ==== #
        queueClient.set_queue_acl(queueName, reqOptions)

        # ==== Construct Return Value ==== #
        return
      end

      def getPermissions(requestInfo, accountInfo)
        queueClient = XSS::Converter::QueueConverter.getQueueService(self, accountInfo)
        # ==== Construct Parameters ==== #
        queueName = requestInfo.queueName
        reqOptions = XSS::Converter::CoreConverter.getRequestOptions(requestInfo.thriftRequestOptions)
        reqOptions.merge! XSS::Converter::CoreConverter::getOperationContextOptions(requestInfo.thriftOperationContext)

        # ==== Operation ==== #
        temp = queueClient.get_queue_acl(queueName, reqOptions)

        # ==== Construct Return Value ==== #
        result = {}
        temp.each do |signedIdentifier|
          key = signedIdentifier.id
          policy = signedIdentifier.access_policy
          value = XSS::AutoGenerated::ThriftSharedAccessQueuePolicy.new
          value.permissions = policy.permission
          value.expiryTime = XSS::Utilities::timeStringToInteger(policy.expiry)
          value.startTime = XSS::Utilities::timeStringToInteger(policy.start)
          result[key] = value
        end
        return result
      end
    end
  end
end