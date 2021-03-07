if( NOT TARGET Cinder-OpenCV4 )

	get_filename_component( CINDER_OPENCV4_PATH "${CMAKE_CURRENT_LIST_DIR}/../.." ABSOLUTE )

	list( APPEND Cinder-OpenCV4_INCLUDES
		${CINDER_OPENCV4_PATH}/include
	)

	if( CINDER_MAC )
		list( APPEND Cinder-OpenCV4_INCLUDES
			${CINDER_OPENCV4_PATH}/include/macos/
		)
		set( CINDER_MAC_OPENCV4_LIB_PATH
			${CINDER_OPENCV4_PATH}/lib/macos/
		)
		list( APPEND Cinder-OpenCV4_LIBRARIES
			${CINDER_MAC_OPENCV4_LIB_PATH}/libippicv.a
			${CINDER_MAC_OPENCV4_LIB_PATH}/libippiw.a
			${CINDER_MAC_OPENCV4_LIB_PATH}/libittnotify.a
			${CINDER_MAC_OPENCV4_LIB_PATH}/libopencv_calib3d.a
			${CINDER_MAC_OPENCV4_LIB_PATH}/libopencv_core.a
			${CINDER_MAC_OPENCV4_LIB_PATH}/libopencv_dnn.a
			${CINDER_MAC_OPENCV4_LIB_PATH}/libopencv_features2d.a
			${CINDER_MAC_OPENCV4_LIB_PATH}/libopencv_flann.a
			${CINDER_MAC_OPENCV4_LIB_PATH}/libopencv_highgui.a
			${CINDER_MAC_OPENCV4_LIB_PATH}/libopencv_gapi.a
			${CINDER_MAC_OPENCV4_LIB_PATH}/libopencv_imgcodecs.a
			${CINDER_MAC_OPENCV4_LIB_PATH}/libopencv_imgproc.a
			${CINDER_MAC_OPENCV4_LIB_PATH}/libopencv_ml.a
			${CINDER_MAC_OPENCV4_LIB_PATH}/libopencv_objdetect.a
			${CINDER_MAC_OPENCV4_LIB_PATH}/libopencv_photo.a
			${CINDER_MAC_OPENCV4_LIB_PATH}/libopencv_stitching.a
			${CINDER_MAC_OPENCV4_LIB_PATH}/libopencv_video.a
			${CINDER_MAC_OPENCV4_LIB_PATH}/libopencv_videoio.a
		)

		find_library( OPENCL_FRAMEWORK OpenCL )
		if( NOT OPENCL_FRAMEWORK )
				message( FATAL_ERROR "OpenCL framework not found" )
		endif()
		list( APPEND Cinder-OpenCV4_LIBRARIES ${OPENCL_FRAMEWORK} )
	elseif( CINDER_LINUX )
		find_package( PkgConfig )
		find_package( OpenCV REQUIRED )

		list( APPEND Cinder-OpenCV4_INCLUDES ${OpenCV_INCLUDE_DIRS} )
		list( APPEND Cinder-OpenCV4_LIBRARIES ${OpenCV_LIBRARIES} )
	endif()
endif()
