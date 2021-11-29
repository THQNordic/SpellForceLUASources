-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 168.324707 , 146.017059 , 25.536499 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(213.591,157.171,24.040);]] )
   Camera:MotionSpline_AddSplinePoint( 173.522949 , 143.762848 , 26.274891 , 7.699995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 186.097717 , 143.973236 , 26.096693 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 202.250824 , 149.313171 , 28.096691 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
