-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 320.067535 , 201.236191 , 18.036457 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10286);]] )
   Camera:MotionSpline_AddSplinePoint( 320.067535 , 201.236191 , 18.036457 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10286);]] )
   Camera:MotionSpline_AddSplinePoint( 320.067535 , 201.236191 , 18.036457 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10286);]] )
   Camera:MotionSpline_AddSplinePoint( 320.067535 , 201.236191 , 18.036457 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10286);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 8.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
