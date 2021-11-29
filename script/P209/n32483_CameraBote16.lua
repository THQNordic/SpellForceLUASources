-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 408.832001 , 362.755249 , 22.673229 , 9.700001 , [[Camera:ScriptSplineLookAtNpc(10085);]] )
   Camera:MotionSpline_AddSplinePoint( 408.832001 , 362.755249 , 22.673229 , 6.399996 , [[Camera:ScriptSplineLookAtNpc(10085);]] )
   Camera:MotionSpline_AddSplinePoint( 408.832001 , 362.755249 , 22.673229 , 9.600000 , [[Camera:ScriptSplineLookAtNpc(10085);]] )
   Camera:MotionSpline_AddSplinePoint( 408.832001 , 362.755249 , 22.673229 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10085);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
