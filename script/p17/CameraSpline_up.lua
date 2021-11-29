-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 1 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 400.014160 , 134.439972 , 29.949308 , 7.999995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 419.494904 , 173.431320 , 108.544922 , 4.399998 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 447.783386 , 180.972000 , 142.523102 , 7.899995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 557.184387 , 166.068970 , 120.131302 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 8.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
