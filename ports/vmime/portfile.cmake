if(VCPKG_TARGET_IS_WINDOWS)
    vcpkg_check_linkage(ONLY_STATIC_LIBRARY)
endif()

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO org-ru/vmime
    REF v1.0.0
    SHA512 8372eb1eb6fadde00b4e7a585af88c0463a05395e8fd7887b5e9c09abadc67b3e4e83b50f7de1ff424525e90c8b5a986c6a5c2cc2d8a7ed07d52a49350f3c3ae
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DVMIME_BUILD_SHARED_LIBRARY=OFF
        -DVMIME_BUILD_STATIC_LIBRARY=ON
        -DVMIME_HAVE_MESSAGING_PROTO_MAILDIR=OFF
        -DVMIME_HAVE_MESSAGING_PROTO_SENDMAIL=OFF
        -DVMIME_HAVE_MESSAGING_PROTO_SMTP=ON
        -DVMIME_HAVE_MESSAGING_PROTO_POP3=OFF
        -DVMIME_HAVE_MESSAGING_PROTO_IMAP=ON
        -DVMIME_HAVE_SASL_SUPPORT=OFF
        -DVMIME_HAVE_TLS_SUPPORT=OFF
        -DVMIME_BUILD_DOCUMENTATION=OFF
        -DVMIME_BUILD_TESTS=OFF
        -DVMIME_BUILD_SAMPLES=OFF
)

message("PORTFILE TEST MESSAGE!!!")

vcpkg_cmake_config_fixup(
	PACKAGE_NAME vmime
)

vcpkg_cmake_install()

