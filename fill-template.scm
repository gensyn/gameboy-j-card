(define (fill-template template path variante backgroundRed backgroundGreen backgroundBlue)
  (let* (
    (image (car (gimp-file-load RUN-NONINTERACTIVE template template)))
    (logo (car (gimp-file-load RUN-NONINTERACTIVE (string-append path "logo.png") (string-append path "logo.png"))))
    (cover (car (gimp-file-load RUN-NONINTERACTIVE (string-append path "cover.png") (string-append path "cover.png"))))
    (backgroundLayer (car (gimp-image-get-layer-by-name image "Background")))

    (gbLogoKleinLayer (car (gimp-image-get-layer-by-name image "GB-Logo-klein")))
    (gbLogoGrossLayer (car (gimp-image-get-layer-by-name image "GB-Logo-gross")))
    (gbFarbeUntenLayer (car (gimp-image-get-layer-by-name image "GB-Farbe-unten")))

    (gbcLogoKleinLayer (car (gimp-image-get-layer-by-name image "GBC-Logo-klein")))
    (gbcLogoGrossLayer (car (gimp-image-get-layer-by-name image "GBC-Logo-gross")))
    (gbcFarbeUntenLayer (car (gimp-image-get-layer-by-name image "GBC-Farbe-unten")))

    (gbaLogoKleinLayer (car (gimp-image-get-layer-by-name image "GBA-Logo-klein")))
    (gbaLogoGrossLayer (car (gimp-image-get-layer-by-name image "GBA-Logo-gross")))
    (gbaFarbeUntenLayer (car (gimp-image-get-layer-by-name image "GBA-Farbe-unten")))

    (backgroundColor (list backgroundRed backgroundGreen backgroundBlue))
  )
    ; HINTERGRUNDFARBE
    (gimp-context-set-background backgroundColor)

    (gimp-image-select-color image CHANNEL-OP-ADD backgroundLayer (list 255 255 255))
    (gimp-drawable-edit-fill backgroundLayer FILL-BACKGROUND)

    ; GB/GBC LOGO
    (if (equal? variante "GB")
      (begin
        (gimp-drawable-set-visible gbLogoKleinLayer TRUE)
        (gimp-drawable-set-visible gbLogoGrossLayer TRUE)
        (gimp-drawable-set-visible gbFarbeUntenLayer TRUE)

        (gimp-drawable-set-visible gbcLogoKleinLayer FALSE)
        (gimp-drawable-set-visible gbcLogoGrossLayer FALSE)
        (gimp-drawable-set-visible gbcFarbeUntenLayer FALSE)

        (gimp-drawable-set-visible gbaLogoKleinLayer FALSE)
        (gimp-drawable-set-visible gbaLogoGrossLayer FALSE)
        (gimp-drawable-set-visible gbaFarbeUntenLayer FALSE)
      )
    )
    
    (if (equal? variante "GBC")
      (begin
        (gimp-drawable-set-visible gbLogoKleinLayer FALSE)
        (gimp-drawable-set-visible gbLogoGrossLayer FALSE)
        (gimp-drawable-set-visible gbFarbeUntenLayer FALSE)

        (gimp-drawable-set-visible gbcLogoKleinLayer TRUE)
        (gimp-drawable-set-visible gbcLogoGrossLayer TRUE)
        (gimp-drawable-set-visible gbcFarbeUntenLayer TRUE)

        (gimp-drawable-set-visible gbaLogoKleinLayer FALSE)
        (gimp-drawable-set-visible gbaLogoGrossLayer FALSE)
        (gimp-drawable-set-visible gbaFarbeUntenLayer FALSE)
      )
    )
    
    (if (equal? variante "GBA")
      (begin
        (gimp-drawable-set-visible gbLogoKleinLayer FALSE)
        (gimp-drawable-set-visible gbLogoGrossLayer FALSE)
        (gimp-drawable-set-visible gbFarbeUntenLayer FALSE)

        (gimp-drawable-set-visible gbcLogoKleinLayer FALSE)
        (gimp-drawable-set-visible gbcLogoGrossLayer FALSE)
        (gimp-drawable-set-visible gbcFarbeUntenLayer FALSE)

        (gimp-drawable-set-visible gbaLogoKleinLayer TRUE)
        (gimp-drawable-set-visible gbaLogoGrossLayer TRUE)
        (gimp-drawable-set-visible gbaFarbeUntenLayer TRUE)
      )
    )

    ; SPIEL-LOGO-VORNE
    (gimp-selection-clear image)

    (gimp-edit-copy-visible logo)

    (let* (
      (floating (car (gimp-edit-paste backgroundLayer TRUE)))
    )
      (gimp-floating-sel-to-layer floating)
    )
    
    (let* (
      (logoLayer (car (gimp-image-get-layer-by-name image "Pasted Layer")))
      (width (car (gimp-drawable-width logoLayer)))
      (height (car (gimp-drawable-height logoLayer)))
      (ratio (/ width height))
    )
      (if (<= ratio 5.7399)
        (begin
          (let* (
            (newWidth (* ratio 223))
          )
            (gimp-layer-scale logoLayer newWidth 223 FALSE)
          )
        )
      )

      (if (> ratio 5.7399)
        (begin
          (let* (
            (newHeight (* (/ height width) 1280))
          )
            (gimp-layer-scale logoLayer 1280 newHeight FALSE)
          )
        )
      )

      (gimp-item-transform-rotate-simple logoLayer ROTATE-90 TRUE 0 0)
      (gimp-layer-set-name logoLayer "Logo")
    
      (let* (
        (logoLayer (car (gimp-image-get-layer-by-name image "Logo")))
        (newHeight (car (gimp-drawable-height logoLayer)))
      )
        (gimp-layer-set-offsets logoLayer 534 (- 1173 (/ newHeight 2)))
      )
    )

    ; SPIEL-LOGO-HINTEN
    (gimp-selection-clear image)

    (gimp-edit-copy-visible logo)

    (let* (
      (floating (car (gimp-edit-paste backgroundLayer TRUE)))
    )
      (gimp-floating-sel-to-layer floating)
    )
    
    (let* (
      (logoLayer (car (gimp-image-get-layer-by-name image "Pasted Layer")))
      (width (car (gimp-drawable-width logoLayer)))
      (height (car (gimp-drawable-height logoLayer)))
      (ratio (/ width height))
    )
      (if (<= ratio 4.1218)
        (begin
          (let* (
            (newWidth (* ratio 476))
          )
            (gimp-layer-scale logoLayer newWidth 476 FALSE)
          )
        )
      )

      (if (> ratio 4.1218)
        (begin
          (let* (
            (newHeight (* (/ height width) 1962))
          )
            (gimp-layer-scale logoLayer 1962 newHeight FALSE)
          )
        )
      )

      (gimp-item-transform-rotate-simple logoLayer ROTATE-270 TRUE 0 0)
      (gimp-layer-set-name logoLayer "Logo-hinten")
    
      (let* (
        (logoLayer (car (gimp-image-get-layer-by-name image "Logo-hinten")))
        (newWidth (car (gimp-drawable-width logoLayer)))
        (newHeight (car (gimp-drawable-height logoLayer)))
      )
        (gimp-layer-set-offsets logoLayer (- 261 (/ newWidth 2)) (- 1004 (/ newHeight 2)))
      )
    )

    ; COVER
    (gimp-edit-copy-visible cover)

    (let* (
      (floating (car (gimp-edit-paste backgroundLayer TRUE)))
    )
      (gimp-floating-sel-to-layer floating)
    )
    
    (let* (
      (coverLayer (car (gimp-image-get-layer-by-name image "Pasted Layer")))
      (width (car (gimp-drawable-width coverLayer)))
      (height (car (gimp-drawable-height coverLayer)))
      (ratio (/ width height))
    )
      (if (> ratio 0.8733)
        (begin
          (let* (
            (newWidth (* ratio 1461))
          )
            (gimp-layer-scale coverLayer newWidth 1461 FALSE)
          )
        )
      )

      (if (<= ratio 0.8733)
        (begin
          (let* (
            (newHeight (* (/ height width) 1276))
          )
            (gimp-layer-scale coverLayer 1276 newHeight FALSE)
          )
        )
      )

      (gimp-image-lower-layer-to-bottom image coverLayer)
      (gimp-layer-set-name coverLayer "Cover")
    )
    
    (let* (
      (coverLayer (car (gimp-image-get-layer-by-name image "Cover")))
      (width (car (gimp-drawable-width coverLayer)))
      (height (car (gimp-drawable-height coverLayer)))
    )
      (gimp-layer-set-offsets coverLayer (- 2045 width) (- 1823 height))
    )

    (gimp-file-save RUN-NONINTERACTIVE image backgroundLayer (string-append path "j-card.xcf") (string-append path "j-card.xcf"))
    (gimp-image-delete image)
    (gimp-quit 0)
  )
)
