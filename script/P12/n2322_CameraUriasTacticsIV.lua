-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 438.991333 , 603.072998 , 43.580856 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(412.332,603.172,42.680);]] )
   Camera:MotionSpline_AddSplinePoint( 434.866882 , 611.978699 , 43.580856 , 9.299999 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 433.207123 , 614.609802 , 43.580853 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 430.889465 , 617.555420 , 43.660854 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
