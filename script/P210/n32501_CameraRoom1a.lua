-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 146.781616 , 479.502563 , 26.094660 , 14.500019 , [[Camera:ScriptSplineLookAtNpc(9561);]] )
   Camera:MotionSpline_AddSplinePoint( 152.752029 , 479.876099 , 25.094660 , 9.600000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 158.736038 , 480.077576 , 24.094660 , 14.400019 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 164.720047 , 480.279053 , 23.094660 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
